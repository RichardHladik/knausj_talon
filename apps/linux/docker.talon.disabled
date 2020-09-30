os: linux
tag: terminal
-

(docker|darker|doctor): "sudo docker "
(docker|darker|doctor) build:
    insert("sudo docker build .")
    key("enter")
(docker|darker|doctor) build (tag|tagged):
    insert("sudo docker build -t \"\" .")
    key("left:3")
(docker|darker|doctor) list images:
    insert("sudo docker images")
    key("enter")
(docker|darker|doctor) list containers:
    insert("sudo docker ps -a")
    key("enter")
(docker|darker|doctor) stop: "sudo docker stop "
(docker|darker|doctor) (remove|delete) image: "sudo docker rmi "
(docker|darker|doctor) (remove|delete) [container]: "sudo docker rm "
(docker|darker|doctor) run: "sudo docker run -d "
(docker|darker|doctor) inspect: "sudo docker inspect "
(docker|darker|doctor) enter: "sudo ~/bin/docker-enter "
