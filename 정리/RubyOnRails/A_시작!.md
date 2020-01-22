# 첫번재 Ruby On Rails 프로젝트 만들기!

>   모든 내용은 필자의 메인 세팅인 Mac OS + brew 를 기반으로 작성하였습니다
>
>   모든 강의(??) 내용에는 https://rubykr.github.io/rails_guides/ 를 참고하였습니다



## 일단 루비를 설치해야겠죠?

```bash
brew install ruby
ruby -v
```

쭈르르륵 설치 된 후 ruby 버전이 나올것입니다!



## 설치되는 동안 레일즈에 대해 알아봅시다!

레일즈는 루비 언어로 작성된 웹 어플리케이션 프레임워크 랍니다.

레일즈는 모든 개발자가 개발을 시작 할때 필요한 초기 준비나 가정들을 쉽게 만ㄷ르 수 있는 도구를 제공하여 웹앱 프로그래밍을 더 쉽게 만들 수 있도록 설계 되어 있답니다.

참고 페이지에 나온 내용을 요약하겠습니다.

레일즈는 철학은 몇가지 원칙을 포함한답니다

-   DRY - "Don't Repeat Yourself (반복하지 말것)" - 코드 리팩토링에 대해 들어보셨을겁니다. 바로 그겁니다! **같은 코드가 존재한다면 그건 나쁜 것**!
-   설정 보다 관습 - 이 원칙은 여러분이 원하는 기능들에 대해 일정한 가정을 바탕으로 해결책을 제공하여 작은 단위의 끝없는 설정 파일을 줄여준답니다.
-   REST 는 웹 어플리케이션의 최고의 패턴인다  리소스와 표준 HTTP 요청 (HTTP verb)에 적합한 웹 어플리케이션 갭라은 가장 빠른 방법입니다.

### MVC 아키텍처

>   모델 뷰 컨트롤러 (M V C)

MVC의 장점은 다음과 같답니다.

-   유저 인터페이스와 비지니스 로직 분리
-   DRY 유지 편이성
-   더 쉬운 유지보수를 위한 코드 관리 편이성



그럼 MVC에 대해 알아볼까요?

#### 모델

모델은 어플리케이션의 정보와 데이터를 다루는 규칙들을 의미합니다.

레일즈의 경우, 모델은 주로 데이터베이스 테이블과 상호 작용하는 규칙들을 관리한답니다.

데이터베이스의 하나의 테이블은 어플리케이션 하나의 모델과 대응합니다.

비지니스 로직은 모델에 집중됩니다.



#### 뷰

어플리케이션의 UI를 의미합니다.

레일즈의 뷰는 주로 데이터 표현에 관련된 루비 코드가 삽입되어 있는 HTML 파일입니다. 뷰는 데이터를 웹 브라우저나 다른 기기에서 데이터를 제공하는 일을 ㄷㅁ당합니다.



#### 컨트롤러

컨트롤러는 모델과 뷰를 "연결" 하는 역할을 합니다. 레일즈의 컨트롤러는 웹브라우저의 요청을 받아, 모델을 통해 데이터를 조회하여 출력을 위해 뷰에게 넘겨줍니다.

### 레일즈의 컴포넌트

레일즈는 많은 미리 개발된 컴포넌트와 함께 제공된답니다.

-   Action Pack
    -   Action Controller
    -   Action Dispatch
    -   Action View
-   Action Mailer
-   Active Model
-   Active Record
-   Active Resource
-   Active Support
-   Railties



>   각각 항목에 1:1로 대응됩니다.

#### 액션 팩

액션 팩은 액션 컨트롤러와 액션 뷰를 포함하는 잼이랍니다. VIEW / CONTROLLER



#### 액션 컨트롤러

액션 컨트롤러는 레일즈 어플리케이션의 컨트롤러를 담당하는 컴포넌트 입니다. CONTROLLER

액션 컨트롤러 프레임워크는 레일즈 어플리케이션으로 들어오는 요청을 처리하고, 파라미터 추출하고, 의도된 액션으로 보냅니다. 액션 컨트롤러는 세션 관리, 템플릿 렌더링, 리다이렉트 관리 서비스를 포함합니다.



#### 액션 디스패치

액션 디스패치는 웹의 요청을 받아들여 원하는 곳으로 연결시킵니다.



#### 액션 뷰

액션 뷰는 레일즈 어플리케이션의 뷰를 관리합니다. 기본적으로 HTML, XML을 만들 수 있습니다.

액션 뷰는 템플릿 렌더링, 중첩 폼 , 조각 템플릿, AJAX 지원을 관리합니다.



#### 액션 메일러

액션 메일러는 내장된 이메일 서비스 프레임워크입니다.



#### 액티브 레코드

액티브 레코드는레일즈 어플리케이션에서 모델의 기초입니다.

액티브 레코드는 데이터베이스 추상화와 기본 CRUD, 고급 검색 능력과 개게들 간의 관계를 정의하는기능을 제공한답니다.



#### 액티브 리소스

액티브 리소스는 비지니스 객체와 RESTful 웹 서비스간의 연결 관리를 위한 프레임워크 이랍니다.

액티브 리소스는 웹 기반의 자원을 로컬 객체의 CRUD 처럼 매핑시킵니다.



#### 액티브 서포트

액티브 서포트는 레일즈가 사용하는 유틸리트 클래스와 표준 루비 확장 모음이랍니다.



#### 레일티즈

레일티즈는 새로운 레일즈 어플리케이션을 만들고 다양한 프레임워크와 플러그인을 이어주는 레일즈의 핵심 코드입니다.



### REST ?

**Representational State Transfer**

RESTful 아키텍쳐의 근간이랍니다. 레일즈의 존재하는 REST 두가지 중요한 원리는

-   자원 표현을 위해 자원 식별자 사용 (URL.. )
-   시스템 컴포넌트 간에 자원 상태 교환





## RUBY 설치가 다됐나요?

### 그럼 Rails... 설치를 해봅시다

-   루비는 gem 이라는 패키지 관리자를 사용한답니다..?
-   가장 쉬운 레일즈 설치를 위해 RubyGem을 이용해 설치해봅시다!

```bash
gem install rails
```



-   첫번째 예시 프로젝트를 만들기 위해 다음 명령어를 실행해봅시다!

```bash
rails new blog
```



### 또 기다릴겸.. 이번에는 생성될 내용들에 대해 살펴볼까요?

>   폴더는 폴더이름/ 으로 기술되었고
>
>   파일은 파일이름 으로 기술하였습니다

-   Gemfile
    -   이 파일은 어플리케이션에 필요한 젬의 의존성 정보를 기술하는데 사용된답니다.
-   README
    -   어플리케이션을 위한 짧막한 설명입니다. 설치, 사용방법 기술등에 쓰인답니다.
-   Rakefile
    -   터미널에서 실행할 수 있는 배치잡들을 포함한답니다.
-   app/
    -   어플리케이션을 위한 컨트롤러, 모델, 뷰를 포함합니다.
-   config/
    -   어플리케이션의 실행 사긴 규칙, 라우팅, 데이터베이스 등 설정을 저장한답니다.
-   config.ru
    -   렉(Rack) 기반의 서버들이 시작할때 필요한 설정이랍니다.
-   db/
    -   데이터베이스의 스키마를 볼 수 있답니다.
        -   데이터 마이그레이션
-   doc/
    -   어플리케이션에 대한 자세한 설명 문서랍니다.
-   lib/
    -   어플리케이션을 위한 확장 모듈이랍니다.
-   log/
    -   어플리케이션의 로그 파일이랍니다.
-   public/
    -   외부에서 볼 수 있는 유일한 폴더랍니다.
    -   이미지, 자바스크립트, 스타일시트나 그 외 정적인 파일들을 넣어두면됩니다.
-   script/
    -   레일즈 스크립트를 포함한답니다.
    -   애플리케이션 실행, 배포, 실행 관련 스크립트를 넣어두면됩니다.
-   test/
    -   유닛 테스트, 픽스쳐, 그 외 다른 테스트 도구들이랍니다.
-   tmp/
    -   임시 파일들이 들어갑니다.
-   vendor/
    -   서드 파티 코드들을 위한 공간이랍니다.
    -   루비 잼 / 레일즈 소스-프로젝트 내에 설치시 호긍ㄴ 미리 패키징된 추가 플러그인들이 위치한답니다.



### 설치가 끝났으면 한번 해볼까요?

#### 필요한 젬 설치하기

젬의 의존성을 기본적으로 bundler 를 통해서 관리한답니다.

생성된 Gemfile에 기술된 젬 외에 다른 잼은 필요없습니다.

아래 명령을 실행해보세요!

```bash
bundle install
```



### 데이터베이스 설정

모든 레일즈 어플리케이션은 데이터베이스와 통신한답니다.

데이터베이스를 사용하기 위해서는 **config/database.yml** 설정 파일이 필요합니다

기본적으로 레일즈상에서 이 파일은 세가지의 환경으로 구성되어 있습니다.

-   development : 개발용
-   test : 자동화된 테스트를 위해 사용
-   production : 실제 서비스에 배포할때 사용됩니다.



#### SQLlite로 설정하기

레일즈는 SQLite3 를 내장해서 배포한답니다.

개발 / 테스트 환경에서는 충분할것같네요

아래는 필자가 작성한 당시 **config/database.yml** 파일입니다.

```yml
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3
```

기본적으로 SQLite3 로 설정되어있네요!



#### 한번 Mysql로 바꿔보겠습니다.

```yml
default: &default
  adapter: mysql2
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  encoding: utf8
  username: root
  password: asdfasdfasdf
  socket: /tmp/mysql.sock
  timeout: 5000
# 아래는 host / port 를 지정하여 접속하는 방법입니다.

default: &default
  adapter: mysql2
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  encoding: utf8
  username: root
  password: asdfasdfasdf
	host: 127.0.0.1
	port: 3306
  timeout: 5000

development:
  <<: *default
  database: blog_development
```



>   데이터베이스의 설정들을 수동으로 갱신할 필요는 없습니다. 어플리케이션 제너레이터의 설정에서 `—database` 항목을 읽어보세요. 이 설정들은 주로 사용되는 관계형 데이터베이스 어뎁터 설정에 도움을 줍니다. 반복해서 `cd .. && rails new blog —database=mysql` 명령을 실행할 수 있습니다. `config/database.yml` 파일 덮어쓰기를 허용하면 어플리케이션을 SQLite 대신에 MySQL 로 설정할 수 있습니다.



## 설정이 완료되었을것 같네요.. 그럼 데이터베이스 생성부터 시작해보죠

데이터베이스 설정이 완료되면, 레일즈로 빈 데이터베이스를 만들 차례랍니다.

다음 rake 명령어로 수행할 수 있습니다.

```bash
rake db:create
```



## 이제 준비는 끝난것 같으니 한번 봐봅시다

다음 명령어를 실행해보세요

```bash
rails server
```

그리고는

http://localhost:3000 으로 접속해보세요!



## 하나만 더해볼까요?

Hello, World! 를 출력하도록 해봅시다.

이럴려면 최소한 컨트롤러와 뷰 하나는 만들어야 한다네요

이렇게 치면 된답니다..

```bash
rails generate controller home index
```



이 명령어가 실행되면 레일즈는 app/views/home/index.html.erb를 포함해 몇가지 파일을 만든답니다.

이 파일은 home 컨트롤러의 index (액션[메소드])를 위한 템플릿으로 이용된답니다.

이 파일을 에디터로 열어 다음 한줄을 넣어주세요

```html
<h1>Hello, World!</h1>
```



그리고 방금 봤던 화면을 지워버리려고 다음 명령어를 실행해볼까요

```bash
rm public/index.html
```



다시 실행해봅시다

```bash
rails server
```



**똑같이 나오네요..!?**



어플리케이션에 새로 만든 컨트롤러를 알려줘야된다네요..

**config/routes.rb** 를 에디터로 열어봅시다.

**이 파일은 외부 요청과 컨트롤러와 액션을 연결하는 방법이 기술된 어플리케이션의 라우팅 파일 이랍니다.**

특별한 DSL로 작성되어있다고 하네요

저에게는

```ruby
Rails.application.routes.draw do
  get '/home/index', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

```

라고 적혀있는데

```ruby
Rails.application.routes.draw do
  get '/home/index', to: 'home#index'
  root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

```

이렇게 작성해봅시다!

일부러 get '/home/index', to: 'home#index' 이라고 살려봤는데

http://localhost:3000/ 로 접속 했을때나,

http://localhost:3000/home/index 로 접속시에도 같은 화면이 나옵니다 대충 이해하겠죠..?





## 레일즈의 발판(Scaffolding)을 이용해서 빠르게 시작하기?

>   레일즈 발판은 어플리케이션의 주요 요소를 빠르게 만드는 방법이라고하네요
>
>   새로운 리소스를 위해 모델, 뷰, 컨트롤러를 만들기 원할때 적합하답니다.



### 리소스 만들기

Post 리소스를 만들어 보자고 하네요..

이 리소스는 블로그에서 하나의 글을 표현한답니다.

다음 명령어를 실행해보세요

```bash
rails generate scaffold Post name:string title:string content:text
```

>   참조 홈페이지의 내용을 인용합니다.
>
>   발판(scaffolding)을 수행하는 작업은 빠르게 진행됩니다. 이 과정에서 생성된 코드는 여러분의 어플리케이션에 완벽하게 적합하지 않을수 있습니다. 대부분의 경우에 생성된 코드를 적절하게 수정하는 작업이 필요합니다. 많은 숙련된 레일즈 개발자들은 발판(scaffolding) 기능을 통해 모든 코드를 생성하거나, 반대로 모든 소스 코드를 손수 만드는 것을 피합니다. 레일즈에서 모델, 컨트롤러, 뷰와 다른 소스 파일들을 적절하게 수정하기가 정말 단순하거든요. 좀 더 자세한 내용은 [레일즈 제너레이터(Generator) 제작과 수정](https://rubykr.github.io/rails_guides/generators.html) 을 참고하세요.

이 명령어를 실행하면 제네레이터는 어플리케이션내 각 디렉토리에 15개의 파일을 생성한답니다.

-   db/migrate/~~~~_create_posts.rb
    -   데이터베이스에 'posts' 테이블을 생성하는 마이그레이션
-   app/models/post.rb
    -   Post **모델**
-   test/fixtures/posts.yml
    -   테스트를 위한 더미 posts
-   app/controllers/posts_controller.rb
    -   Post **컨트롤러**
-   app/views/posts/index.html.erb
    -   모든 posts 를 출력하는 index **뷰**
-   app/views/posts/edit.html.erb
    -   존재하는 post 를 수정하는 eidt **뷰**
-   app/views/posts/show.html.erb
    -   단일 post를 보여주는 show **뷰**
-   app/views/posts/new.html.erb
    -   새로운 post를 만들기 위한 new **뷰**
-   app/views/posts/\_form\_.html.erb
    -   post 를 수정하거나 새로 만드는데 사용되는 폼을 저장하는 조각 파일
-   app/helpers/posts_helper.rb
    -   post 뷰를 위한 헬퍼 함수를 위한 파일
-   test/unit/post_test.rb
    -   posts 모델을 위한 유닛 테스트 파일
-   test/functional/posts_controller_test.rb
    -   posts 컨트롤러을 위한 기능 테스트 파일
-   test/unit/helpers/posts_helper_test.rb
    -   posts 헬퍼를 위한 유닛 테스트 파일
-   config/routes.rb
    -   posts 를 위한 라우팅 정보를 담은 수정된 라우팅 파일
-   public/stylesheets/scaffold.css
    -   발판뷰를 좀더 미려하게 만드는 CSS 파일



### 아까.. 데이터베이스 마이그레이션 파일이 만들어졌죠?

아까 만들어진

**db/migrate/~~~~_create_posts.rb** 파일을 열어봅시다

```ruby
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

```

저는 이렇게 나왔네요



마이그레이션 파일은

-   마이그레이션 작업을 수행하는 **up**
-   나중에 적용된 마이그레이션을 되돌리는 **down**

이렇게 두가지 메소드를 가진답니다.

**up 과 down 은 change 로 바뀌었다고 합니다 하지만 여전히 사용 가능하답니다**

[자세한 내용](https://edgeguides.rubyonrails.org/active_record_migrations.html)

위 경우 



이 마이그레이션 파일을 적용해봅시다

```bash
rake db:migrate
```





## 링크를 추가해볼까요?

생성된 홈페이지에 posts 쓰기를 추가하려면 링크를 추가해줘야죠?

**app/views/home/index.html.erb** 를 열고 다음과 같이 수정하세요!

```erb
<h1>Hello, Rails!</h1> <%= link_to "My Blog", posts_path %>
```

-   link_to
    -   레일즈의 뷰 헬퍼로 내장된 메소드랍니다.
    -   텍스트를 기바으로 한 링크를 생성합니다.
        -   이경우에는 posts_path의 경로겠네요

>   기본 환경인, 개발(development) 모드에서 레일즈는 브라우저의 매 요청마다 여러분의 어플리케이션을 갱신합니다. 그래서 웹서버를 중지시키거나 재시작할 필요가 없습니다.



## 모델

**app/models/post.rb** 는 아직 단순하네요

```ruby
class Post < ApplicationRecord
  
end

```

>   이 파일에는 별 내용이 없습니다.
>
>   그러나 `Post` 클레스는 `ActiveRecord::Base`를 상속합니다. 액티브 레코드(Active Record)는 레일즈 모델을 자유롭게 다루는데 훌륭한 기능을 제공합니다. 기본 데이터베이스 CRUD, 읽기(Read), 갱신(Update), 삭제(Destroy) 기능, 데이터 검증, 복잡한 검색과 복합적인 모델 관계 지원 이런 것들을 포함합니다.

#### 데이터 검증 추가하기

레일즈는 데이터를 저장할때 데이터가 적합한지 확인하는 데이터 검증 메소드를 가지고 있답니다.

**app/models/post.rb** 파일을 열어서 수정하세요!

```ruby
class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
end
```

이렇게 수정하면

모든 글 (post)들은 이름(name) 과 제목(title)을 가지고 있어야하고, 제목은 최소 5글자 이상이라는걸 보장(확인) 한답니다.

레일즈는 모델에 대해서 다양한 조건의 데이터를 검증할 수 있습니다.

컬럼의 값 존재 여부, 유일성, 포맷, 그리고 관계된 객체의 존재 여부 검사 등을 포함합니다.



### 콘솔을 사용해봅시다!

액션에서 데이터 검증을 확인해보려면, 콘솔을 사용할 수 있답니다.

```bash
rails console
```



한번 이대로 따라해볼까요

```bash
>> p = Post.new(:content => "A new post")
=> #<Post id: nil, name: nil, title: nil,
     content: "A new post", created_at: nil,
     updated_at: nil>
>> p.save
=> false
>> p.errors
=> #<OrderedHash { :title=>["can't be blank",
                           "is too short (minimum is 5 characters)"],
                   :name=>["can't be blank"] }>
```

>   개발 웹서버와 다르게, 콘솔에서는 각 라인마다 자원을 다시 읽어들이지는 않습니다. 콘솔을 열어둔 상태에서 코드를 변경하였으면 이를 콘솔의 환경에 반영하기 위해서 `reload!` 입력하세요.



모든 글 목록 보기

모든 글의 목록을 출력하는 부분입니다.

**app/controllers/posts_controller.rb** 파일을 열고 index 액션을 보세요

```ruby
  def index
    @posts = Post.all
  end
```



이부분을 이렇게 바꿔볼까요

```ruby
def index
	@posts = Post.all
	
	respond_to do |format|
		format.html # index.html.erb
		format.xml { render :xml => @posts }
	end
  end
```

>   액티브 레코드(Active Record)에 관한 더 자세한 정보는 [액티브 레코드 쿼리 인터페이스](https://rubykr.github.io/rails_guides/active_record_querying.html) 글을 참고하세요.



respond_to 블록은 이 액션에 대한 HTML, XML 양쪽 모두 취급하게 만들어버렸습니다!

http://localhost:3000/posts.xml 을 요청하게되면, XML 포맷의 글 목록(posts)를 확인 할 수 있답니다.

이름에 연결되는 HTML 포맷은 **app/views/posts/** 폴더 안에서 찾을 수 있습니다.

레일즈는 액션에서 사용되는 모든 인스턴스 변수를 뷰안에서 사용할 수 있게 구성되어 있답니다.

**app/views/posts/index.html.erb** 내용이랍니다

```erb
<p id="notice"><%= notice %></p>

<h1>Posts</h1>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Title</th>
      <th>Content</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @posts.each do |post| %>
      <tr>
        <td><%= post.name %></td>
        <td><%= post.title %></td>
        <td><%= post.content %></td>
        <td><%= link_to 'Show', post %></td>
        <td><%= link_to 'Edit', edit_post_path(post) %></td>
        <td><%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Post', new_post_path %>

```

이 뷰는 @posts 배열을 순환하며 내용과 링크를 보여준답니다.

-   link_to 는 세부 항목에대한 링크를 만듭니다.
-   edit_post_path 와 new_post_path 는 레일즈가 제공하는 RESTful 라우팅 부분이랍니다.
-   이 헬퍼들의 다양한 모습을 컨트롤러가 포함한 다른 액션들에서 볼수 있답니다.


>   이번 버전의 레일즈에서는, 반드시 `<%=h post.name %>` 사용해서 페이지에 출력할때 HTML에 적합하도록 변환(escape)해야 했습니다. 레일즈 3.0에서 이것은 기본 값입니다. 만약 변환을 원하지 않는다면 (unescape) `<%= raw post.name %>` 이렇게 사용해 주세요.

>   랜더링 과정에 관한 더 자세한 내용은 [레이아웃(Layouts)과 렌더링](https://rubykr.github.io/rails_guides/layouts_and_rendering.html) 을 참고하세요.



### 레이아웃 수정하기! [6.8 까지 작성]

https://rubykr.github.io/rails_guides/getting_started.html