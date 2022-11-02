#!/bin/bash
set -x
cd /root/project
if [[ $1 == "sh" ]]; then 
	sh
else
	if [[ -e Gemfile ]]; then
		echo "*** Installing Gems in Gemfile ***"
		bundle install 
		EXEC="bundle exec"
	fi

	if [[ $# -gt 0 ]]; then
		$EXEC jekyll $@ 
	else
		if [[ ! -e _config.yml ]] ; then
			mv Gemfile* /tmp
			ls -al
			jekyll new .
			mv /tmp/Gemfile* .
		fi
		while [ 1 ] ; do
			rm -rf _site/*
			$EXEC jekyll serve --incremental --host=0.0.0.0 # --verbose
			set -e
			echo 'Press CTRL+C again to quit'
			sleep 1
			set +e
			echo 'Restarting...'
		done
	fi
fi
