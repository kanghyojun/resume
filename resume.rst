강효준
======

백엔드 소프트웨어 엔지니어
--------------------------

좋은 제품을 함께 만들며 성장하고 싶습니다.
오픈 소스로 더 나은 소프트웨어를 만들고 싶습니다.

개인 정보
---------

핸드폰
    +82 10-8733-2439

이메일
    iam.kanghyojun@gmail.com

GitHub
    https://github.com/kanghyojun

웹사이트
    http://kanghyojun.org

LinkedIn
    https://www.linkedin.com/in/kanghyojun/


기술
----

- 언어: Python, Haskell, TypeScript, JavaScript, HTML, CSS, Scala
- 데이터베이스: PostgreSQL, MySQL
- 프레임워크와 도구: Flask, SQLAlchemy, React, Vim, Git, Mercurial
- 인프라: AWS 제품들


경력
----

- `Spoqa`_ 풀스택 프로그래머 2015.2 --
- `H Labs`_ 파트 타임 프로그래머 2014.10 -- 2015.1
- `Beatpacking Company`_ 백엔드 프로그래머 인턴 2013.07 -- 2013.11
- `Seedle`_ 공동 창업자, 백엔드 프로그래머  2012.04 -- 2013.03
- `Software Maestro`_ 멘티 2010.07 -- 2010.12


학력
----

- 서울 과학 기술 대학교 컴퓨터 공학과 (휴학) 2012.03 --
- 선린 인터넷 고등학교 웹 운영과 2008.03 -- 2011.02

.. _Spoqa: htts://spoqa.com
.. _Beatpacking Company: http://beatpacking.com
.. _Trinity Studio: http://trinity.so
.. _Software Maestro: http://www.swmaestro.kr/main.do
.. _H Labs: http://zari.me


오픈 소스
---------

- `니름`_: 니름은 IDL 컴파일러이고 마이크로 서비스를 위한
  RPC/분산 객체 프레임워크입니다. 회사 동료와 같이 개발하기 시작하여
  회사의 마이크로 서비스에도 적용했습니다. 이와 관련된 파이콘 발표, 파이콘
  스프린트를 열었습니다.
- `dodotable`_: SQLAlchemy의 쿼리 객체를 HTML로 바로 표현할 수 있는
  라이브러리입니다. 사내에서 백오피스를 만들때 적극적으로 사용하고 있습니다.
- `tsukkomi`_: Python 3.5에 도입된 타입 어노테이션을 이용해 런타임에서 타입
  검사를 하는 라이브러리입니다.
- `mmcq.py`_: Modified Median Color Quantization 구현체인 `color-theif`_\ 를
  Python으로 포팅한 라이브러리입니다. 사진에서 대표색 몇가지를 뽑아 보여줍니다.
- `소란`_: 자신이 들었던 노래의 기록을 남기고 취향을 공유하는 서비스의
  코드입니다. 오픈 소스로 친구와 같이 만들었던 GraphDB `MINTPRESSO`_\ 를
  API 서버에서 사용해보고, 크롬 확장 프로그램을 만들어 노래를 기록하도록
  만들었습니다.

.. _`니름`: https://github.com/nirum-lang/nirum
.. _`dodotable`: https://github.com/spoqa/dodotable
.. _`tsukkomi`: https://github.com/spoqa/tsukkomi
.. _`mmcq.py`: https://github.com/kanghyojun/mmcq.py
.. _`소란`: https://github.com/team-soran
.. _`MINTPRESSO`: https://github.com/mintpresso
.. _`color-theif`: https://github.com/lokesh/color-thief/


제품과 프로젝트
---------------

스포카
~~~~~~

매장 마케팅 솔루션 도도 포인트로 매장과 손님을 세련되게 연결합니다. 풀스택
엔지니어로 일하면서 신제품 개발, 외부 서비스 연동, 서비스 운영 등 많은 팀을
경험해왔습니다. 최근에 제품팀 팀장 역할을 맡게 되어 팀 빌딩, 목표 설정 등의
일을 맡고 있습니다.

- 도도 포인트 스토어 (TypeScript, React): 손님의 핸드폰 번호로 적립할 수 있는
  제품입니다. 처음부터 기여하지는 못했고 라인과 도도 포인트의 연동 프로젝트를
  진행하며 간단한 기능 구현, 버그 수정과 운영을 진행했습니다.
- 도도 인사이트 (Python, Flask, SQLAlchemy, Jinja): 도도 인사이트는 크게 두가지
  기능을 제공합니다. 첫번째로 도도 포인트 스토어로 모은 손님 정보를 점주가
- 도도 메시지 (Python, JavaScript, Flask, SQLAlchemy, Jinja, React):
- 도도 매니저 (TypeScript, React):

H Labs
~~~~~~

호텔, 펜션, 게스트 하우스 예약 관리 플랫폼을 서비스하는 H Labs 초기에
파트 타임으로 같이 참여했습니다. 메인 서비스에 많은 기여를 하지 못했고
채널 매니저라는 별개의 프로젝트를 진행하였습니다. 현재는 "온다"라는 이름으로
서비스 중 입니다.

- 채널 매니저(Python, CoffeeScript, Selenium): 숙박 업소 예약 관리를 위해서
  각종 agoda 혹은 expedia 같은 예약 플랫폼에 객실 정보를 동기화 해야합니다.
  하지만 여러 플랫폼을 동시에 관리할 수 있는 방법은 없었습니다. 당시에는
  제공되는 API가 없었기에 Selenium을 이용해서 객실 정보를 동기화하고 관리하도록
  만들었습니다.

Beatpacking Company
~~~~~~~~~~~~~~~~~~~

유저들이 자신의 취향대로 만들어진 플레이리스트를 공유할 수 있는 음악 서비스,
비트를 서비스 했습니다. 인턴으로 일하면서 주로 API 서버 개발에 참여했습니다.
API 연동이나 간단한 모바일 앱 기능 추가를 위해 안드로이드 개발도
조금 참여하였습니다.

- 비트 API 서버 (Python, Flask, SQLAlchemy): 비트 앱에 필요한 API를
  만들었습니다. 서비스 오픈을 위해 음악 파일을 관리할 수 있는 백오피스도
  구현하였습니다.

Seedle
~~~~~~

자신의 사진을 다른 사람과 공유하는 소셜 큐레이션 서비스입니다. 공동 창업자 및
백엔드 소프트웨어 엔지니어 개발자로 일했습니다.

- `Seedle`_ (Python, Scala, HTML, CSS, CoffeeScript, jQuery): 유저가 사진을
  업로드하고 볼수 있도록 프론트엔드와 백엔드를 맡아서 구현하였습니다.

.. _`Seedle`: ./seedle.html

Software Maestro
~~~~~~~~~~~~~~~~

과학기술정보통신부와 정보통신기술진흥센터에서 주관하고,
한국정보산업연합회에서 운영하는 소프트웨어 마에스트로 과정 1기로 활동했습니다.
소프트웨어 마에스트로는 국내 소프트웨어 전문가들을 만들자는 취지하에
운영되고 있습니다.

- `pykey`_ (Python): Key-value 스토리지를 Python으로 개발했습니다.
- `bendy`_ (Python): LISP 방언을 Python으로 개발했습니다.

.. _`pykey`: ./pykey.html
.. _`bendy`: ./bendy.html


발표
----

- 파이콘 한국 2018 발표: `나도 할 수 있다 오픈 소스! — setup.py에서 PyPI까지 <https://www.slideshare.net/kanghyojun/ss-110767619>`_
- 파이콘 한국 2017 발표: `니름: 쉬운 SOA 단위 테스트 <https://www.slideshare.net/kanghyojun/soa-78799290>`_
- 파이콘 한국 2016 라이트닝 토크: `스포카와 오픈소스, 2016 PyCon APAC <https://github.com/kanghyojun/2016-pycon-lightning-talk>`_
