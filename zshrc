export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
ZSH_THEME="agnoster"

plugins=(git
	vscode
	zsh-syntax-highlighting
  vi-mode
	extract)

source $ZSH/oh-my-zsh.sh


# >>> alias >>>
# >>>>>> tmux
alias tm='tmux new -s mu'
alias tx='tmux new -s '
alias lst='tmux ls'
alias att='tmux attach -t'
alias all='tmux kill-server'
alias kil='tmux kill-session -t'
# >>>>>> git
alias gd='git branch -d'
alias gr='git branch -m'
alias gs='git switch'
# >>>>>> zsh
alias v=nvim
alias th=trash
alias py=python3
alias s=source
alias mk=mkdir
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vi='nvim ~/.config/nvim/init.lua'
alias vl='cd ~/.config/nvim/lua/config'
alias z="cd"
alias ltr='ls -ltr'
# >>>>>> shortcut
alias h=~
alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias con='cd ~/.config'
# >>>>>> Miscellaneous
alias audio='yt-dlp -f bestaudio -g'
alias bins='brew install'
# >>> alias >>>

# >>>NVM configuration>>>
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# >>>NVM configuration>>>

# <<< Function add music <<<
add() {
	#check parameters
	if [[ $# -ne 2 ]]; then
		echo "Usage: add [genre] [url]"
		return 1
	fi

	local audio_link
	audio_link=$(yt-dlp -f bestaudio -g "$2" 2>/dev/null)

	#check yt-dlp
	if [[ $? -ne 0 || -z $audio_link ]]; then
		echo "Error: Failed to extract audio URL. Please check the URL."
		return 1
	fi

	# insert alias command
	sed -i ''  '$a\'$'\n'"alias $1='mpv $audio_link'"$'\n' ~/.zshrc

	source ~/.zshrc
	echo "Success!"
}
# <<< Function add music <<<

# <<< Function add alias <<<
adias() {
	#check parameters
	if [[ $# -ne 2 ]]; then
		echo "Usage: add [alias] [origin]"
		return 1
	fi

	# insert alias command
	sed -i ''  '$a\'$'\n'"alias $1=$2"$'\n' ~/.zshrc

	source ~/.zshrc
	echo "alias $1=$2"
}
# <<< Function add alias <<<
# >>>yazi>>>
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# >>>yazi>>>

# >>> function add music >>>

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# >>> music >>>
alias lofi='mpv https://manifest.googlevideo.com/api/manifest/hls_playlist/expire/1735898301/ei/XWB3Z7HyGtbFsfIPzMLhsQo/ip/2601:641:4000:1060:83b:bf81:2016:3528/id/jfKfPfyJRdk.3/itag/234/source/yt_live_broadcast/requiressl/yes/ratebypass/yes/live/1/goi/133/sgoap/gir%3Dyes%3Bitag%3D140/rqh/1/hdlc/1/hls_chunk_host/rr4---sn-o097znss.googlevideo.com/xpc/EgVo2aDSNQ%3D%3D/playlist_duration/3600/manifest_duration/3600/spc/x-caUFR5EUT7-O-APIZWLkUsMPkhFPjDJdcpa05OW3aC2uS9z5NR/vprv/1/playlist_type/DVR/hcs/sd/initcwndbps/4430000/met/1735876701,/mh/rr/mm/44/mn/sn-o097znss/ms/lva/mv/m/mvi/4/pl/34/rms/lva,lva/smhost/rr3---sn-o097znse.googlevideo.com/dover/13/pacing/0/short_key/1/keepalive/yes/fexp/51326932,51335594,51371294/mt/1735876348/sparams/expire,ei,ip,id,itag,source,requiressl,ratebypass,live,goi,sgoap,rqh,hdlc,xpc,playlist_duration,manifest_duration,spc,vprv,playlist_type/sig/AJfQdSswRQIgSXa6foTamM7ljTMOaYjFJUHyu64U80dklK_qSR5gncoCIQCMT65IOse876JLRyNKS7-9GDPtPTNYmHFgYZhqMtPCcw%3D%3D/lsparams/hls_chunk_host,hcs,initcwndbps,met,mh,mm,mn,ms,mv,mvi,pl,rms,smhost/lsig/AGluJ3MwRAIgTDlaYguLkGIW6vyyJDj9Q8855lh2pKmu63Qoq7nm-8oCIGaiSLK54h3R3IPRrNZ_Yoo_6GlNZCGq44Ggc56tN7cw/playlist/index.m3u8'
