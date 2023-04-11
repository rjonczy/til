# all: deploy

# make post title=new-post.md
post:
	hugo new posts/$(title)

server: theme
	hugo server -D .

theme:
	git submodule init
	git submodule update

clean:
	rm -rf public/

.FORCE:
