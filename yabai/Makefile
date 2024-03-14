all: 
	install
	update
	start

install:
	sudo brew install koekeishiya/formulae/yabai

update: stop uninstall-service upgrade start

start:
	sudo yabai --start-service

stop:
	- sudo yabai --stop-service

uninstall-service: 
	- sudo yabai --uninstall-service

upgrade: 
	brew upgrade yabai
	./update-sudoers.sh

