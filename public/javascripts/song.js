var links = document.getElementsByName("DeleteSong");
for (link in links) {
	link.addEventListener('click', editLinkClicked, false);
}

function editLinkClicked(l) {
	$.post('/songs/delete', {id: l.sid}, null, "script");
}