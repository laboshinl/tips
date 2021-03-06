#Захват сетевого трафика. Форматы файлов снимков данных Pcap, PcapNg

Программа захвата сетевых пакетов, часто называемая анализатором пакетов, 
анализатором сети или просто сниффером (от англ. to sniff — нюхать), —
это программа, библиотека или устройство, которое получает (фактически подслушивает) пакеты данных, 
проходящие через определенный сегмент сети, к которому она подключена с помощью сетевой платы.
Терминология, связанная со средствами захвата и анализа сетевого трафика может быть немного запутанной. 
Большинство программ, записывающих пакеты из сети и обрабатывающих их, производя, например, 
разбор заголовков или извлечение данных для последующей обработки, называются анализаторами, 
пакетными анализаторами, сетевыми анализаторами, снифферами. В данной работе используется термин **сниффер** для устройства, 
производящего получение копии необработанных пакетов с сетевой карты или сетевого интерфейса и 
термин сетевой анализатор для устройств, обрабатывающих полученные сниффером **снимки** или так называемые **дампы**.
Таким образом, программное обеспечение для декодирования пакетных
данных и их анализа, такое как tcpdump, wirehasrk, например, можно рассматривать и как снифферы 
(так как все они полагаются на библиотеку захвата трафика) и как анализаторы пакетов. С другой стороны, например, библиотеки,
такие как Libpcap или Winpcap следует рассматривать просто как инструменты захвата трафика.

Libpcap является библиотекой захвата для UNIX-систем. Системы Windows
используют порт Libpcap под названием Winpcap. Эта библиотека предоставляет
программисту программный интерфейс для использования средств фильтра пакетов BSD или любой другой архитектуры, 
основанной на пакетном фильтре Беркли, для создания программ сетевого захвата на уровне пользователей. Libpcap был
выпущен разработчиками tcpdump исследователями лаборатории Лоуренса Беркли.
Libpcap предоставляет следующие возможности: захват пакетов с сетевой
карты, запись и чтение пакетов в файлы снимков. Libpcap был извлечен из программы tcpdump и распространяется в виде библиотеки. 
Ответственным за развитие этой библиотеки является группа разработчиков tcpdump.

Одними из самых распространенных форматов хранения полных данных сетевого трафика являются формат Pcap (англ. Packet
CAPture) и его обновленная версия PcapNg (Pcap Next generation). Оба формата представляют собой бинарные файлы, состоящие
из глобального заголовка, позволяющего его идентифицировать и записей для каждого захваченного пакета ([рис.][pcap_file]).

 ![pcap_file][pcap_file]
 [pcap_file]: ../img/pcap_file.png
         Структура файла снимка сетевого трафика.
         
Далее будут рассмотрены структура и поля заголоков для обоих типов файлов, и их различия.
 
## Формат пакетной записи формата Pcap

## Формат пакетной записи формата PcapNg