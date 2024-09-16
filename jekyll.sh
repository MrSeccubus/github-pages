#!/bin/bash
set -x
cd /root/project
if [[ $1 == "sh" || $1 == "/bin/sh" ]]; then 
	sh
else
	set +x
	[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
	[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
	[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
	[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
	set -x
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
			set +x
			[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
			[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
			[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
			[[ "$(find /root -name ".age" -ctime +90)" == "" ]] || echo "***** Image is over 90 dyas old, somebody tell @MrSeccubus *****"
			set -x
		done
	fi
fi
