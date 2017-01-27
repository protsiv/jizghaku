#Setup the project

   * git clone git@github.com:protsiv/jizghaku.git
   * cd jizghaku/
   * bundle
   * rake db:create
   * psql jizhaku_development < db/jizhaku_backup
   * rake db:seed
   * rails s
   * [login](http://localhost:3000/users/login)
   * login email  `protsiv.roman@gmail.com`
   * login password  `password`
