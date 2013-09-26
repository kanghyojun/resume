Seedle API
===========

Seedle API에 Request Content는 JSON으로 보내져야한다. 현재는 Response 값도 JSON 밖에 없다. (추후에 XML이나 다른 것 구현.)

    {
      "content": {
        "type": …
        …
      },
      "accept": "ACCEPT"
    }
    
ACCEPT에 허용되는 값들은 다음과 같다.

 - Seed
 - Comment
 - User
 - Like
 - Photo
 - Notification

OAuth Authentication
----------------------

API를 요청할 때 access_token을 같이 요청해야하며, OAuth 인증으로 토큰은 얻을 수 있다.

Grant Request
``````````````````

유저에게 app이 실행하는 권한을 허가받고 획득한다.

::

    /oauth/auth?redirect_uri=YOUR_SITE&client_id=CLIENT_ID&response_type=code&state=EXAMPLE&scope=SCOPE

Query
``````````````````
  
  - redirect_uri: **REQUIRED**, ``code`` 를 받을 callback uri를 말함 
  - client_id: **REQUIRED**, API key 에서 발급받은 ``client_id``
  - response_type: **REQUIRED**, 반드시 ``code`` 로 설정되야함
  - state: OPTIONAL, CSRF 토큰을 말함.
  - scope: **REQUIRED**, 유저에게 허가받을 권한 내용 다음과 같은 권한이 있음.
    - email: 유저의 기본정보(이메일 나이 등에 접근할 수 있는 권한)
    - seed: 유저의 씨앗을 올리고 수정할 수 있는 권한.
    - comment: 유저의 댓글을 올리고 수정할 수 있는 권한.
    - collection: 유저의 모음을 올리고 수정할 수 있는 권한.
    - notification: 유저의 알림을 받아볼 수 있는 권한.
    - internal: 유저의 모든 권한을 얻을 수 있음. 내부 메인 어플리케이션만 사용가능
    - basic: internal을 제외한 모든 권한을 얻을때 사용함.

Grant Response
``````````````````

유저가 승낙한다면 다음과 같은 query가 ``redirect_uri`` 로 돌아옴.

::
    
    redirect_uri?code=GENERATED_CODE&state=STATE
 
에러 발생시 다음과 같은 query가 돌아온다.

::

    redirect_uri?error=ERROR_CODE
    
error code는 다음과 같음.

  - invalid_request 
  - ~
  - ~
  - ~

Access Token Request
```````````````````````

access token을 얻기위해 다음과 같은 요청이 필요함

::

    /oauth/token?redirect_uri=YOUR_SITE&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=GENERATED_CODE&grant_type=authorization_code&state=STATE
    
Query
~~~~~~~~~~~~~

  - redirect_uri: **REQUIRED**, grant request에 사용했던 uri와 동일해야한다.
  - client_id: **REQUIRED**, API key로 발급받은 client_id
  - client_secret: **REQUIRED**, API key로 발급받은 client_secret
  - code: **REQUIRED**, Response로 받은 code
  - grant_type: **REQUIRED**, 반드시 ``authoriazation_code`` 로 명시되야함.
  - state: OPTIONAL, CSRF 토큰

Access Token Response
``````````````````````

요청 성공시, 다음과 같은 json으로 응답한다

::

    {
      "success": true,
      "access_token": ACCESS_TOKEN,
      "token_type": "bearer"
    }
    
요청 실패시 다음과 같은 json으로 응답한다

::

    {
      "success": false,
      "message": ERROR MESSAGE,
      "content": {
        "code": ERROR_CODE
      }
    }

위의 ``ERROR_CODE`` 는 다음과 같다.

 - invalid.request
 - oauth.undefined.redirectURI
 - ~
 - ~
 
Authentication
---------------------

현재 Seedle API의 인증은 로그인 세션을 통해서 이루어진다. 따라서 인증이 필요한 API에 요청할때는 Header에 cookie를 같이 보내야한다.

Seed
-----------

POST /seed
```````````````

사진을 보내거나 Seed를 등록한다.

Content-Type: Multipart form data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

파일을 업로드할 수 있다. data에 파일을 포함시켜야한다.

 - Query: ``seed[]: File``

Content-Type: JSON
~~~~~~~~~~~~~~~~~~~~~~~

자신의 기본 모음에 있던 사진을 다른 모음으로 업로드한다. content body에는 밑의 내용이 포함되어야한다.

::

    {"content": {
      "seed": {
        "collectionId": id: Int,
        "title": title: String,
        "body": body: String
      },
      "accept": "Seed"
    }

POST /seed/filter , type - findAllUnpostedByOwner
````````````````````````````````````````````````````

유저가 포스트하지않은 모든 씨앗(기본 모음에 가지고 있는 씨앗)을 가지고온다. User 인증이 필요하다. 다음과 같은 content body가 포함되어야한다.

::

    {"content": {
      "type": "findAllUnpostedByOwner"
      },
      "accept": "Seed"
    }

POST /seed/filter , type - findSomeOrderByCreatedAt
```````````````````````````````````````````````````````

모든 씨앗들을 최신순으로 가지고온다. 다음과 같은 content body가 포함되어야한다.

::

    {"content": {
      "type": "findSomeOrderByCreatedAt",
      "limit": limit: Long,
      "offset": offset: Long
     },
     "accept": "Seed"
    }

GET /seed/:id
``````````````````

:id 씨앗의 정보를 가지고온다. Accept: application/json으로 명시해야 데이터를 json으로 가져올 수 있음.

DELETE /seed/:id
````````````````````

:id 씨앗을 지운다. 유저의 인증이 필요하다. 권한이 없는 유저가 씨앗을 지우려고하면 실패한다.

POST /seed/url
````````````````````

URL로 씨앗을 올린다. 로그인된 유저의 권한이 필요하다. 

::

    {"content": {
      "urls": ["http://imageurl.com/image.jpeg", "http://foo.kr/bar.gif", ...]
      },
      "accept": "Seed"
    }

GET /seed/random
``````````````````

seed를 랜덤하게 가져온다. 최근 10개는 순서대로 가지고오고 나머지는 랜덤으로 가지고옴.

Query 
~~~~~~~~~

 - offset
 - limit

Like
----------

GET  /seed/:id/like
`````````````````````

``:id`` 씨앗에 '좋아요'한 모든 유저들의 정보를 가지고온다.

POST /seed/:id/like
``````````````````````

``:id`` 씨앗에 '좋아요'를 한다. 유저 인증이 필요하다. 이미 '좋아요'했던 씨앗에 요청하면 실패한다.

DELTE /seed/:id/unlike
`````````````````````````

``:id`` 씨앗에 '좋아요'를 취소한다. 유저 인증이 필요하다. '좋아요'하지 않은 씨앗에 요청하면 실패한다.

Comment
-----------

GET /seed/:id/comment
`````````````````````````````````

``:id`` 씨앗에 등록된 모든 comment를 가지고온다.

POST /seed/:id/comment
```````````````````````

``:id`` 씨앗에 댓글을 단다. 유저 인증이 필요하다.

GET /collection/:id/seed?offset=0&limit=20
```````````````````````````````````````````

:id 콜렉션에 있는 모든 seed의 정보를 가지고온다. offset, limit를 querystring으로 요청할수있다.

GET /seed/category/:category?offset=0&limit=20
````````````````````````````````````````````````

``:category`` 에 속해있는 모든 seed의 정보를 가지고온다. offset, limit를 querystring으로 요청할수있다.

Content
~~~~~~~~

::

    {
      "content": {
        "body": "body: String"
      },
      "accept": "Comment"
    }

 Collection
---------------

``CATEGORY`` 에 허용되는 값은 다음과 같다.

 - art
 - apparel
 - life
 - food
 - entertainment
 - animal
 - fun
 - technology
 
GET /collection/:id
`````````````````````

:id 모음의 정보를 가지고온다.

POST /collection
`````````````````````

모음을 생성한다.

Content
~~~~~~~~~~~~~~~~~~~~~

::

    {
      "content": {
        "title": "title: String",
        "description": "desc: String",
        "kind": "public | private",
        "category": "CATEGORY"
      },
      "accept": "Collection"
    }

POST /collection/filter , type - findAllByOwner
``````````````````````````````````````````````````````````````

유저의 모든 모음을 가지고온다. 유저 인증이 필요하다.

Content
~~~~~~~~~~~~~~~~

::

    {
      "content": {
        "type": "findAllByOwner"
      },
      "accept": "Collection"
    }
    
POST /collection/filter , type - findAllByOwnerOrderByName
```````````````````````````````````````````````````````````

유저의 모든 모음을 이름순으로 정렬해서 가지고온다. 유저 인증이 필요하다.

Content
~~~~~~~~~~~~~

::

    {
      "content": {
        "type": "findAllByOwner"
      },
      "accept": "Collection"
    }

POST /collection/filter , type - findAllByOwnerOrderByCategory
````````````````````````````````````````````````````````````````````

유저의 모든 모음을 카테고리 순으로 정렬해서 가지고온다. 유저 인증이 필요하다.

POST /collection/filter , type - findAllByOwnerOrderByModifiedAt
````````````````````````````````````````````````````````````````````

유저의 모든 모음을 최신 사용 순으로 정렬해서 가지고온다. 유저 인증이 필요하다.

Content
~~~~~~~~~~~

    {
      "content": {
        "type": "findAllByOwner"
      },
      "accept": "Collection"
    }

User
--------

GET /user/validation 
``````````````````````

유저가 등록할 수 있는 이름, 이메일, 아이디의 유효성을 검사한다.

Query
~~~~~~~~~

  - type="mail|name|identity"
  - accept="User"
  - data=":data"

GET /:identity
``````````````````````

:identity 유저의 정보를 가져온다.

POST ? PUT /:identity
``````````````````````

:identity 유저의 정보를 업데이트한다.

 Content
~~~~~~~~~~

    {
      "content": {
        "url": "url: String",
        "password": "password: String",
        "name": "name: String",
        "mail": "mail: String"
      },
      "accept": "ACCEPT"
    }
    
 GET  /:url/follow
````````````````````````````````````````````````````````````````````


:url 의 유저가 관심을 가지고있는 사람을 가져옵니다.

 GET /:url/follower
````````````````````````````````````````````````````````````````````


:url 의 유저에게 관심을 가지고있는 사람을 가져옵니다.

 POST /:url/follow
````````````````````````````````````````````````````````````````````


access_token의 유저가  :url 유저에게 관심을 갖습니다.

 Query Parametor
~~~~~~~~~~~~~~~~~~
  
  - access_token

 DELETE /:url/follow
````````````````````````````````````````````````````````````````````


access_token의 유저가 :url 유저에게 관심을 끊습니다.

 Query Parametor
~~~~~~~~~~~~~~~~~~~~~
  
  - access_token   

 Photo
------------


 GET /photo/:id/:width x :height
````````````````````````````````````````````````````````````````````

:id 사진의 썸네일을 가지고온다.(eg `http://theseedle.com/photo/1/200x200`)

width나 height중 한 값이 0이면, 아닌값 기준으로 사이즈를 맞춰서 가지고온다.

(eg. 만약 1200x600 사진이라면, ``/photo/1/200x0`` 을 요청하면 200x100 사이즈의 섬네일을 가지고올수있고, ``/photo/1/0x200`` 을 요청하면 400x200 사이즈의 섬네일을 가지고온다.)


 Notification
--------------------------------------------------------------------

 GET /notification
````````````````````````````````````````````````````````````````````

유저의 모든 알림을 가지고온다. 유저 인증이 필요하다.

 GET /notification/listen 
````````````````````````````````````````````````````````````````````

유저의 알림을 실시간으로 가지고온다. 유저 인증이 필요하다.
