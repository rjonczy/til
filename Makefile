# all: deploy

# make post title=new-post.md
post:
	hugo new posts/$(title)

server:
	hugo server -ws .

site:
	hugo --minify
	minify -r -o public/ -a public/
	find public -type d -print0 | xargs -0 chmod 755
	find public -type f -print0 | xargs -0 chmod 644

clean:
	rm -rf public/

.FORCE:
