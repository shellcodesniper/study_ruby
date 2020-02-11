# 라우터

-   Rails router는 URL을 인식하여 컨트롤러의 action 혹은 Rack appllication 으로 보낸다



## URL 을 code 로 연결하기

GET /patients/17 을 받았을때

router에 물어본후 매치되는 controller action 을 찾는다.

처음으로 매칭되는 라우터

```ruby
get '/patients/:id', to 'patients#show'
```

를 발견했다.

이 요청은 patients 컨트롤러의 show 액션으로 { id: '17'} 이라는 항목과 같이 dispatch 된다.



## 코드로부터 Path 와 URL 마늗리

또한 paths 와 urls 를 새엇ㅇ할 수도 있다.

전에 나온 코드를 다음과 같이 바꿔보자

```ruby
get '/patients/:id', to: 'patients#show', as: 'patient'
```



그리고 나의 appliction 속 컨트롤러에 다음과 같은 코드를 포함했다고하자

```ruby
@patient = Patient.find(params[:id])
```

그리고 이것에 대응하는 뷰:

```erb
<%= link_to 'Patient Record', patient_path(@patient) %>
```

그럼 라우터는 `/patients/17` 라는 위치를 만들어 낼 것이다. 이건 당신의 불안정한 뷰를 예쁘게 바꿔줄것이고 손쉽게 이해가능하게 해준다.

`id doesn't need to be specified in route helper.`



## 라우터 설정하기

-   당신의 application 혹은 engine 을 위한 라우터는 `config/routes.rb` 에 위치하고있다.

-   보통 이렇게 보일것이고요

    ```ruby
    
    Rails.application.routes.draw do
      resources :brands, only: [:index, :show] do
        resources :products, only: [:index, :show]
      end
     
      resource :basket, only: [:show, :update, :destroy]
     
      resolve("Basket") { route_for(:basket) }
    end
    ```

    >   The Rails.application.routes.draw do ... end block that wraps your route definitions is required to establish the scope for the router DSL and must not be deleted.

## 

## Resource 라우팅 : 레일즈의 기본

-   Resource routing은 모든 common routes for a give resourceful controller 에 대한 정의를 빠르게 해줍니다.
-   예를들어  GET / POST / PATCH / PULL / DELETE 같은 메소드
-   각 메소드들은 perform an operation on the resource 를 요청합니다.
-   리소스 라우터는 하나의 라인에서 정의됩니다.

Rails application 에 연결 요청이 들어왔을때

```
DELETE /photos/17
```

라우터에 연결된 컨트롤러 요청이 들어옵니다.

```ruby
reosources :photos
```

이때 레일즈는 요청을 photos 컨트롤러에 있는 destroy 액션으로 { id : '17' } 파라미터와 함께 보냅니다.



## CRUD, Verbs, and Actions

레일즈에는, resourceful route가 HTTP verbs, URLs 와 controller action 사이 매핑을 제공합니다.

편리함을 위해 각각 액션은 데이터베이스에 미리 정의된 CRUD operation 과 연결됩니다.

```ruby
resources :photos
```

를 예로들면

7개의 각각 다른 route를 생성하고 이 전부는 Photos 컨트롤러에 연결됩니다.

| HTTP Verb | Path             | Controller#Action | Used for                                     |
| :-------- | :--------------- | :---------------- | :------------------------------------------- |
| GET       | /photos          | photos#index      | display a list of all photos                 |
| GET       | /photos/new      | photos#new        | return an HTML form for creating a new photo |
| POST      | /photos          | photos#create     | create a new photo                           |
| GET       | /photos/:id      | photos#show       | display a specific photo                     |
| GET       | /photos/:id/edit | photos#edit       | return an HTML form for editing a photo      |
| PATCH/PUT | /photos/:id      | photos#update     | update a specific photo                      |
| DELETE    | /photos/:id      | photos#destroy    | delete a specific photo                      |



>   Because the router uses the HTTP verb and URL to match inbound requests, four URLs map to seven different actions.

>   Rails routes are matched in the order they are specified, so if you have a `resources :photos` above a `get 'photos/poll'` the `show` action's route for the `resources`line will be matched before the `get` line. To fix this, move the `get` line **above** the `resources` line so that it is matched first.



## Path 와 URL Helpers

resourceful route를 만드는것은 expose a number of helpers to the controllers in your application

`resources :photos` 를 예로들면

-   phoos_path returns /photos
-   new_photo_path returns /photos/new
-   edit_photo_path(:id) returns /photos/:id/edit (예를들어 edit_photo_path(10) returns /photos/10/edit)
-   photo_path(:id) returns /photos/:id (예를들어 photo_path(10) return /photos/10 )

이각각의 헬퍼들은 has a corresponding _url helper (such as photos_url) which returns the same path prefixed with the current host, port, and path prefix





## 여러개의 resources 를 한번에 생성하기

만약 여러개의 resources 를 위한 라우트를 생성해야된다면 이렇게 사용하시면 됩니다.

```ruby
resources :photos, :books, :videos
```

이렇게 적어두시면 아래와같이 정확히 일치하게 동작합니다.

```ruby
resources :photos
resources :books
resources :videos
```



## singular Resources

때때로, resource that clients always look up without referencing an ID 가 있습니다.

예를들어 `/profile` 을 요청시 항상 로그인된 유저의 프로필을 보여주고 싶다면

singular resource 가 `/profile` (이게 아닌 `/profile/:id` )에 show 라는 액션을 가르키게 하고 싶다면

```ruby
get 'profile', to: 'user#show'
```

`String` 을 `to:` 에 'controller#action' 의 형태로 넘겨주면 됩니다.

`to:` 에 Symbol 을 넘겨주고 싶다면 `action:` 으로 바꿔써쥣면 됩니다.

`String` 에 # 이 포함되어 있지 않다면 to: 옵션은 controller 로 바꿔주어야만합니다.

```ruby
get 'profile', action: :show, controllers: 'users'
```

This resourceful route:

```ruby
resource :geocoder
resolve('Geocoder') { [:geocoder]}
```



여섯개의 다른 라우트가 만들어지고, 전부 Geocoders 컨트롤러로 매핑됩니다.



| HTTP Verb | Path           | Controller#Action | Used for                                      |
| :-------- | :------------- | :---------------- | :-------------------------------------------- |
| GET       | /geocoder/new  | geocoders#new     | return an HTML form for creating the geocoder |
| POST      | /geocoder      | geocoders#create  | create the new geocoder                       |
| GET       | /geocoder      | geocoders#show    | display the one and only geocoder resource    |
| GET       | /geocoder/edit | geocoders#edit    | return an HTML form for editing the geocoder  |
| PATCH/PUT | /geocoder      | geocoders#update  | update the one and only geocoder resource     |
| DELETE    | /geocoder      | geocoders#destroy | delete the geocoder resource                  |



>   Because you might want to use the same controller for a singular route (`/account`) and a plural route (`/accounts/45`), singular resources map to plural controllers. So that, for example, `resource :photo` and `resources :photos` creates both singular and plural routes that map to the same controller (`PhotosController`).

Singular resourceful route 는 다음 helpers를 생성해냅니다.

-   new_geocoder_path returs /geocoder/new
-   edit_geocoder_path returns /geocoder/edit
-   geocoder_path returns /geocoder

As with plural resources, the same helpers ending in _url will also include the host, port, and path prefix_



## Controller Namespaces 와 라우팅

어쩌면 controllers 그룹을 네임스페이스 아래 묶고 싶을수 있습니다.

예를들어, 여러개의 관리자 컨트롤들을 Admin:: 네임스페이스 아래에 묶어버릴때, 아마 컨트롤러들을 app/controllers/admin/ 폴더 아래 놓고 라우터에서 그룹화합니다.

```ruby
namespace :admin do
	resources :articles, :comments
end
```

이렇게 하면 articles 와 comments 컨트롤러를 위한 여러개의 라우트들이 생성됩니다.

예를들어 `Admin::ArticlesController` 처럼요.

 Rails 는 아래와 같은 라우트들을 생성할것입니다.

| HTTP Verb | Path                     | Controller#Action      | Named Route Helper           |
| :-------- | :----------------------- | :--------------------- | :--------------------------- |
| GET       | /admin/articles          | admin/articles#index   | admin_articles_path          |
| GET       | /admin/articles/new      | admin/articles#new     | new_admin_article_path       |
| POST      | /admin/articles          | admin/articles#create  | admin_articles_path          |
| GET       | /admin/articles/:id      | admin/articles#show    | admin_article_path(:id)      |
| GET       | /admin/articles/:id/edit | admin/articles#edit    | edit_admin_article_path(:id) |
| PATCH/PUT | /admin/articles/:id      | admin/articles#update  | admin_article_path(:id)      |
| DELETE    | /admin/articles/:id      | admin/articles#destroy | admin_article_path(:id)      |

만약 `Admin::ArticlesController` 에 `/articles (앞에 /admin 이 붙지 않도록)` 를 생성하고 싶다면

```ruby
scope module: 'admin' do
	resources :articles, :comments
end
```

혹은 한줄로

```ruby
resources :articels, module: 'admin'
```

으로 생성할 수 있습니다.

만약 `/admin/articles` 를 `ArticlesController` 로 라우팅 하고싶다면 (Admin:: 모듈 prefix 없이)

```ruby
scode '/admin' do
	resources :articles, :comments
end
```

혹은 한줄로

```ruby
resources :articles, path: '/admin/articles'
```

로 작성할 수 있습니다.

각각의 case 들은, named routes remain the same as if you didn't use scope.

In the last case, the following paths map to ArticlesController



| HTTP Verb | Path                     | Controller#Action | Named Route Helper     |
| :-------- | :----------------------- | :---------------- | :--------------------- |
| GET       | /admin/articles          | articles#index    | articles_path          |
| GET       | /admin/articles/new      | articles#new      | new_article_path       |
| POST      | /admin/articles          | articles#create   | articles_path          |
| GET       | /admin/articles/:id      | articles#show     | article_path(:id)      |
| GET       | /admin/articles/:id/edit | articles#edit     | edit_article_path(:id) |
| PATCH/PUT | /admin/articles/:id      | articles#update   | article_path(:id)      |
| DELETE    | /admin/articles/:id      | articles#destroy  | article_path(:id)      |

>   *If you need to use a different controller namespace inside a `namespace` block you can specify an absolute controller path, e.g: `get '/foo', to: '/foo#index'`.*



## Nested Resources

It's common to have resources that are logically children of other resources.

만약 아래와 같이 모델이 정의되어있다면

```ruby

class Magazine < ApplicationRecord
  has_many :ads
end
 
class Ad < ApplicationRecord
  belongs_to :magazine
end
```

Nested routes 는 라우터들의 연결관계를 알아냅니다. 만약 위의 경우에 아래와 같이 routes.rb 를 작성해주시면 됩니다.

```ruby

resources :magazines do
  resources :ads
end

```



magazine 에 대한 라우트들은 부가적으로,  ads 를 `AdsController` 에 연결해줍니다.

The ad URLs require a magazine:

| HTTP Verb | Path                                 | Controller#Action | Used for                                                     |
| :-------- | :----------------------------------- | :---------------- | :----------------------------------------------------------- |
| GET       | /magazines/:magazine_id/ads          | ads#index         | display a list of all ads for a specific magazine            |
| GET       | /magazines/:magazine_id/ads/new      | ads#new           | return an HTML form for creating a new ad belonging to a specific magazine |
| POST      | /magazines/:magazine_id/ads          | ads#create        | create a new ad belonging to a specific magazine             |
| GET       | /magazines/:magazine_id/ads/:id      | ads#show          | display a specific ad belonging to a specific magazine       |
| GET       | /magazines/:magazine_id/ads/:id/edit | ads#edit          | return an HTML form for editing an ad belonging to a specific magazine |
| PATCH/PUT | /magazines/:magazine_id/ads/:id      | ads#update        | update a specific ad belonging to a specific magazine        |
| DELETE    | /magazines/:magazine_id/ads/:id      | ads#destroy       | delete a specific ad belonging to a specific magazine        |

게다가  `magazine_ads_url` and `edit_magazine_ad_path` 과 같은 routing helpers 들을 만들어줍니다.

These helpers take an instance of Magazine as the first parameter (`magazine_ads_url(@magazine)`).



## Nesting 제한



nest router 아래 또 다른 nest route 를 하고싶을경우:

```ruby

resources :publishers do
  resources :magazines do
    resources :photos
  end
end
```

하지만 이렇게 깊게 연결된 resource 들은 번거롭고 성가시고 보기힘들고 ~~~~ 합니다...

이와 같은 경우에는 다음과 같은 주소를 인식합니다.

```
/publishers/1/magazines/2/photos/3
```

The corresponding route helper would be `publisher_magazine_photo_url`, requiring you to specify objects at all three levels. Indeed, this situation is confusing enough that a popular [article](http://weblog.jamisbuck.org/2007/2/5/nesting-resources) by Jamis Buck proposes a rule of thumb for good Rails design:

>   Resources 들은 하나 이상 깊게 들어가지 말길 바랍니다..



## Shallow Nesting

위와 같은 깊게 파고든 nesting 을 피하기 위한 방법으로 부모 아래 계층적인 느낌으로 action 들을 모아두는것이 있습니다, 다시말해, Resource 를 구분 할 수 있는 적은 정보만으로 라우트를 만드는것입니다.

```ruby
resources :articles do
	resources :comments, only: [:index, :new, :create]
end
resources :comments, only [:show, :edit, :update, :dstroy]
```



이 아이디어는 descriptive routes 와 deep nesting 의 균형을 주는듯한 느낌을 줍니다. :shallow 옵션을 구현 하기 위한 짧은 문법을 가지고있습니다.

```ruby
resources :articles do
	resources :comments, shallow: true
end
```



첫번째 예시와 정확히 같은 라우트를 생성해냅니다. 부모 resource 에 :shallow 옵션을 줄 수도 있는데, 모든 resource 들이 shallow 될것입니다.



```ruby
resources :articles, shallow: true do
	resources :comments
	resources :quotes
	resources :drafts
end
```



DSL 의 `shallow`는 creates a scope inside of which every nesting is shallow. 이전 예시와 정확히 같은 라우트를 생성합니다:

```ruby
shallow do
	resources :articels do
		resources :comments
		resources :quotes
		resources :drafts
	end
end
```

There exist two options for `scope` to customize shallow routes. `:shallow_path` prefixes member paths with the specified parameter:

```ruby
scope shallow_path: "sekret" do
	resources :articles do
		resources :comments, shallow: true
	end
end
```



The comments resource here will have the following routes generated for it:



| HTTP Verb | Path                                         | Controller#Action | Named Route Helper       |
| :-------- | :------------------------------------------- | :---------------- | :----------------------- |
| GET       | /articles/:article_id/comments(.:format)     | comments#index    | article_comments_path    |
| POST      | /articles/:article_id/comments(.:format)     | comments#create   | article_comments_path    |
| GET       | /articles/:article_id/comments/new(.:format) | comments#new      | new_article_comment_path |
| GET       | /sekret/comments/:id/edit(.:format)          | comments#edit     | edit_comment_path        |
| GET       | /sekret/comments/:id(.:format)               | comments#show     | comment_path             |
| PATCH/PUT | /sekret/comments/:id(.:format)               | comments#update   | comment_path             |
| DELETE    | /sekret/comments/:id(.:format)               | comments#destroy  | comment_path             |



The `:shallow_prefix` option addes the specified parameter to the named route helpers:

```ruby
scope shallow_prefix: "sekret" do
	resources :articles do
		resources :comments, shallow: true
  end
end
```



| HTTP Verb | Path                                         | Controller#Action | Named Route Helper       |
| :-------- | :------------------------------------------- | :---------------- | :----------------------- |
| GET       | /articles/:article_id/comments(.:format)     | comments#index    | article_comments_path    |
| POST      | /articles/:article_id/comments(.:format)     | comments#create   | article_comments_path    |
| GET       | /articles/:article_id/comments/new(.:format) | comments#new      | new_article_comment_path |
| GET       | /comments/:id/edit(.:format)                 | comments#edit     | edit_sekret_comment_path |
| GET       | /comments/:id(.:format)                      | comments#show     | sekret_comment_path      |
| PATCH/PUT | /comments/:id(.:format)                      | comments#update   | sekret_comment_path      |
| DELETE    | /comments/:id(.:format)                      | comments#destroy  | sekret_comment_path      |



https://guides.rubyonrails.org/routing.html#routing-concerns

여기부터 재작성

https://morningbird.tistory.com/42











