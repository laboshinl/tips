# Программный интерфейс управления версии v1 системы Tractor

---

## /files

#### Available endpoints

* [/files/list](#fileslist)
* [/files/process](#filesprocess)

* [/file/{job_id}/status](#filejob_idstatus)
* [/file/{job_id}/details](#filejob_iddetails)
* [/file/{job_id}/statistics](#filejob_idstatistics)* [/file/{job_id}/statistics/labels](#filejob_idstatisticslabels)
* [/file/{job_id}/statistics/ip](#filejob_idstatisticsip)

* [/file/{job_id}/flows/labels](#filejob_idflowslabels)

* [/labels/list](#labelslist)

### /files/list
Collection of available files in repository

#### **GET**:
Get the files collection

### Response code: 200

#### application/json (application/json) 

```
[
  {
    "name": "some file name",
    "extension": "pcap",
    "time_start": 1530476322,
    "time_end": 1530878322,
    "status": {
      "state": "finished",
      "started_at": 1530878325,
      "finished_at": 1530878333,
      "job_id": 12345
    },
    "size": 102
  },
  {
    "name": "some file name 2",
    "extension": "pcapng",
    "time_start": 1530476322,
    "time_end": 1530878322,
    "status": {
      "state": "new"
    },
    "size": 36
  }
]
```

##### List of *File*:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| name |  string | file name | true |  |
| extension |  string | file extension | true |  |
| time_start |  integer | start timestamp period of file | true |  |
| time_end |  integer | end timedtamp period of file | true |  |
| status |  object | status of file | true |  |
| size |  integer | filesize in kB | true |  |
| flows_count |  integer | Count of flows | false |  |

status:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| state |  string | Value of status | true |  |
| started_at |  integer | Start time of processing | false |  |
| finished_at |  integer | End time of processing | false |  |
| job_id |  integer | uniqie job id | false |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /files/process
Process of available files in repository

#### **POST**:
Start process of file

#### FileName (application/json) 

```
{
  "file_name": "some_file_name_with_extension.pcap"
}
```

##### *FileName*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| file_name |  string | file name with extension | true |  |

### Response code: 200

#### FileStatus (application/json) 

```
{
  "state": "in_progress",
  "started_at": 1530878325,
  "job_id": 12345
}
```

##### *FileStatus*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| state |  string | Value of status | true |  |
| started_at |  integer | Start time of processing | false |  |
| finished_at |  integer | End time of processing | false |  |
| job_id |  integer | uniqie job id | false |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

## /file

#### Available endpoints

* [/files/list](#fileslist)
* [/files/process](#filesprocess)

* [/file/{job_id}/status](#filejob_idstatus)
* [/file/{job_id}/details](#filejob_iddetails)
* [/file/{job_id}/statistics](#filejob_idstatistics)* [/file/{job_id}/statistics/labels](#filejob_idstatisticslabels)
* [/file/{job_id}/statistics/ip](#filejob_idstatisticsip)

* [/file/{job_id}/flows/labels](#filejob_idflowslabels)

* [/labels/list](#labelslist)

### /file/{job_id}/status
Status of file

#### **GET**:
Get status of file

### Response code: 200

#### FileStatus (application/json) 

```
{
  "state": "in_progress",
  "started_at": 1530878325,
  "job_id": 12345
}
```

##### *FileStatus*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| state |  string | Value of status | true |  |
| started_at |  integer | Start time of processing | false |  |
| finished_at |  integer | End time of processing | false |  |
| job_id |  integer | uniqie job id | false |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /file/{job_id}/details

#### **GET**:
Get file details by job id

### Response code: 200

#### File (application/json) 

```
{
  "name": "some file name",
  "extension": "pcap",
  "time_start": 1530476322,
  "time_end": 1530878322,
  "status": {
    "state": "finished",
    "started_at": 1530878325,
    "finished_at": 1530878333,
    "job_id": 12345
  },
  "size": 102,
  "flows_count":30000
}
```

##### *File*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| name |  string | file name | true |  |
| extension |  string | file extension | true |  |
| time_start |  integer | start timestamp period of file | true |  |
| time_end |  integer | end timedtamp period of file | true |  |
| status |  object | status of file | true |  |
| size |  integer | filesize in kB | true |  |
| flows_count |  integer | Count of flows | false |  |

status:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| state |  string | Value of status | true |  |
| started_at |  integer | Start time of processing | false |  |
| finished_at |  integer | End time of processing | false |  |
| job_id |  integer | uniqie job id | false |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /file/{job_id}/statistics

#### **GET**:
Get general statistic of processed file

### Response code: 200

#### application/json (application/json) 

```
[
  {
    "title": "protocols",
    "content": [
      {
        "label": "ftp",
        "count": 10
      },
      {
        "label": "udp",
        "count": 16
      }
    ]
  },
  {
    "title": "clients",
    "content": [
      {
        "label": "ip",
        "count": 10
      }
    ]
  }
]
```

##### List of *StatisticItem*:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| title |  string | Title of statistic item | true |  |
| content | items array | Iterable array of content items | true |  |

items:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| label |  string |  | true |  |
| count |  integer |  | true |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /file/{job_id}/statistics/labels

#### **GET**:
Get statistics based by Labels

###### Query parameters

| Name | Type | Description | Required | Examples |
|:-----|:----:|:------------|:--------:|---------:|
| label | string |  | true |  |

### Response code: 200

#### application/json (application/json) 

```
[
  {
    "title": "protocols",
    "content": [
      {
        "label": "ftp",
        "count": 10
      },
      {
        "label": "udp",
        "count": 16
      }
    ]
  },
  {
    "title": "clients",
    "content": [
      {
        "label": "ip",
        "count": 10
      }
    ]
  }
]
```

##### List of *StatisticItem*:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| title |  string | Title of statistic item | true |  |
| content | items array | Iterable array of content items | true |  |

items:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| label |  string |  | true |  |
| count |  integer |  | true |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /file/{job_id}/statistics/ip

#### **GET**:
Get statistics based by IP

###### Query parameters

| Name | Type | Description | Required | Examples |
|:-----|:----:|:------------|:--------:|---------:|
| ip | string |  | true |  |

### Response code: 200

#### DetailsIp (application/json) 

```
{
  "country": "USA",
  "city": "NewYork",
  "user_agent": "Macintosh/Mozilla1.0",
  "domain_name": "example.com",
  "statistics": [
    {
      "title": "protocols",
      "content": [
        {
          "label": "ftp",
          "count": 10
        }
      ]
    },
    {
      "title": "cients",
      "content": [
        {
          "label": "ip",
          "count": 10
        }
      ]
    }
  ]
}
```

##### *DetailsIp*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| country |  string | County | true |  |
| city |  string | City | true |  |
| user_agent |  string | User Agent | false |  |
| domain_name |  string | Domain name | false |  |
| statistics | items array | Iterable array of statistics items | true |  |

items:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| title |  string | Title of statistic item | true |  |
| content | items array | Iterable array of content items | true |  |

items:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| label |  string |  | true |  |
| count |  integer |  | true |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

### /file/{job_id}/flows/labels

#### **GET**:
Get statistics based by Labels

###### Query parameters

| Name | Type | Description | Required | Examples |
|:-----|:----:|:------------|:--------:|---------:|
| label | string |  | true |  |

### Response code: 200

#### application/json (application/json) 

```
[
  {
    "client_ip": "192.168.88.80",
    "client_port": 34567,
    "server_ip": "8.8.8.8",
    "server_port": 80,
    "time_start": 12345678,
    "time_end": 12345679,
    "comment": "some comment"
  },
  {
    "client_ip": "192.167.88.82",
    "client_port": 34,
    "server_ip": "1.1.1.1",
    "server_port": 9090,
    "time_start": 12345678,
    "time_end": 12345679,
    "comment": "some comment"
  }
]
```

##### List of *DetailsLabelItem*:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| client_ip |  string | Client IP | true |  |
| client_port |  integer | Client Port | true |  |
| server_ip |  string | Server IP | true |  |
| server_port |  integer | Server Port | true |  |
| time_start |  integer | Session start time | true |  |
| time_end |  integer | Session end time | true |  |
| comment |  string | Comment | true |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

## /labels

#### Available endpoints

* [/files/list](#fileslist)
* [/files/process](#filesprocess)

* [/file/{job_id}/status](#filejob_idstatus)
* [/file/{job_id}/details](#filejob_iddetails)
* [/file/{job_id}/statistics](#filejob_idstatistics)* [/file/{job_id}/statistics/labels](#filejob_idstatisticslabels)
* [/file/{job_id}/statistics/ip](#filejob_idstatisticsip)

* [/file/{job_id}/flows/labels](#filejob_idflowslabels)

* [/labels/list](#labelslist)

### /labels/list

#### **GET**:
Get labels collection

### Response code: 200

#### application/json (application/json) 

```
[
  {
    "group_name": "social",
    "labels": [
      "facebook",
      "vk"
    ]
  },
  {
    "group_name": "peer2peer",
    "labels": [
      "bittorrent",
      "skype"
    ]
  },
  {
    "group_name": "peer2peer",
    "labels": [
      "vpn",
      "sokcs5"
    ]
  },
  {
    "group_name": "other",
    "labels": [
      "ssh",
      "telnet"
    ]
  }
]
```

##### List of *Label*:

| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| group_name |  string | Group name of certain labels | true |  |
| labels |  array | array of labels | true |  |

### Response code: 404

#### Error (application/json) 

```
{
  "status": 404,
  "code": 404,
  "message": "Not found"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

### Response code: 500

#### Error (application/json) 

```
{
  "status": 500,
  "code": 500,
  "message": "Internal server error"
}
```

##### *Error*:
| Name | Type | Description | Required | Pattern |
|:-----|:----:|:------------|:--------:|--------:|
| status |  integer |  | true |  |
| code |  integer |  | true |  |
| message |  string |  | true |  |

---

