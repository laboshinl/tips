#Подготовка данных для обучения системы классификации


## Изоляция трафика приложения с ипользованием Linux Namespaces

С появлением таких утилит, как LXC и Docker стало возможным очень легко изолировать процессы в 
Linux системе в их собственное системное окружение. Это дало возможность запускать целый набор приложений 
на одной Linux машине и быть уверенным в том, что они не будут мешать друг другу, 
без необходимости использования виртуальных машин.

Ключевая функциональность ядра, которая позволяет добиться такой изоляции – 
Linux Namespaces, появилась в Linux начиная с версии 2.4.19 в 2002 году (CLONE_NEWNS),
после чего с последующими обновлениями ядра добавлялись новые:

1. UTS namespaces (CLONE_NEWUTS, Linux 2.6.19)
2. IPC namespaces (CLONE_NEWIPC, Linux 2.6.19)
3. PID namespaces (CLONE_NEWPID, Linux 2.6.24)
4. Network namespaces (CLONE_NEWNET, Linux 2.6.29)
5. User namespaces (CLONE_NEWUSER, Linux 3.8)
6. cgroup namespace (CLONE_NEWCGROUP, Linux 4.0)


Аналогично тому, как chroot позволяет процессам видеть только определённую директорию как корень файловой системы – 
механизмы Linux namespaces позволяют выполнять операции изоляции в других механизмах операционной системы, 
такими как дерево процессов, сетевые интерфейсы, точки монтирования, IPC и так далее.

Для изоляции сетевого трафика приложения нас интересуют в первую очередь Network Namespaces.
Network namespaces позволяют в рамках одной машины в каждом netns иметь собственные, изолированные от других:
 * набор таблиц маршрутизации;
 * arp-таблицу;
 * правила iptables;
 * устройства.


Создаем namespace:
``` bash
ip netns add R0
```

В новом изолированном пространстве, отсутвуют сетевые интерфейсы
```
ip netns exec R0 ip a
```
> 1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00


Создаем пару виртуальных интерфейсов:
```bash
ip link add veth-a type veth peer name veth-b
```

{% hint style="info" %}
 Тип создаваемого интерфейса - «Virtual Ethernet»
{% endhint %}

Перенесем интерфейс veth-a из initial network namespace в 
namespace R0:

``` bash
ip link set veth-a netns test
```

Настроим ip-адреса на созданных виртуальных интерфейсах:

```
ip netns exec test ifconfig veth-a up 10.0.0.1 netmask 255.255.255.0
``` 

```
ifconfig veth-b up 10.0.0.254 netmask 255.255.255.0
```

Настроим шлюз по-умолчанию для изолированного интерфейса:

```
ip netns exec test route add default gw 10.0.0.254 dev veth-a
```

Активируем ip_forward
```
echo 1 > /proc/sys/net/ipv4/ip_forward
```
   
С помощью iptables настроим  NAT для интерфейса.
```
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j SNAT --to-source 192.168.88.80
```

Теперь в созданом netspace можно запустить процесс, трафик которого нужно записать, 
и программу захвата трафика, например _wireshark_

```
ip netns exec test Telegram
ip netns exec test wireshark
```

## Программа захвата трафика приложения

![start_capture][start_capture]
[start_capture]: ../img/start_capture.png
        Рис.: Запуск мессенжера телеграм в утилите захвата сетевого трафика

![during_capture][during_capture]
[during_capture]: ../img/start_capture.png
        Рис.: Выделенный сетевой интерфейс для приложения Telegram
        
![capture_result]
[capture_result]: ../img/capture_result.png
        Рис.: Файл снимка сетевого трафика приложения Telegram