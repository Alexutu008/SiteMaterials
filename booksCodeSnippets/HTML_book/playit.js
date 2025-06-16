const el = document.getElementsByClassName('element')[0]
const play = document.getElementById("playbutton")
const pause = document.getElementById("pausebutton")

playButton.addEventListener('click', ()=> Element.style.animationPlayState = "running")
pauseButton.addEventListener('click', ()=> Element.style.animationPlayState = "paused")
