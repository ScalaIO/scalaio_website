
import sys.process._
import scala.language.postfixOps


val repoCleverProd:String=""
val repoCleverPreProd:String=""

@main
def main(env: String) = {

  println("hello World")

  "elm-pages build" !

  "cd ./dist" !

  "pwd" !

  "git init" !

  "git add ." !

  "git commit -m 'new version' " !

  "git remote add clever git+ssh://git@push-n2-par-clevercloud-customers.services.clever-cloud.com/app_ac41bb13-ae16-4344-927b-4de9aaa53a69.git" !

  "git push clever master" !

  println("deploy WIP")




}




