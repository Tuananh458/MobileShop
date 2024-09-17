function floattingLabelCombobox(inputBox) {
	var spanElement = inputBox.parentElement.getElementsByTagName("span").item(0);
	if (inputBox.nodeName == "SELECT")
		if (inputBox.selectedIndex <= 0)
			spanElement.className = "non-floatting-label";
		else
			spanElement.className = "floatting-label";
	else if (inputBox.nodeName == "INPUT")
		if (inputBox.value == "" || inputBox == null)
			spanElement.className = "non-floatting-label";
		else
			spanElement.className = "floatting-label";
}

function uploadFile(buttonElement) {
	buttonElement.parentElement.getElementsByTagName("input").item(0).click();
}

function loadPreviewImage(event) {
	var preview_image_box = document.getElementById("preview-image-box");
	preview_image_box.getElementsByTagName("img").item(0).src = URL.createObjectURL(event.target.files[0]);
	preview_image_box.style.display = "block";
	output.onload = function () {
		URL.revokeObjectURL(event.target.files[0]);
	}
}

function floattingLabelHide() {
	var inputboxes_div = document.getElementById("form_nhap").getElementsByTagName("form").item(0).getElementsByClassName("inputbox");
	const loop = [...inputboxes_div];
	loop.forEach(e => floattingLabelCombobox(e.children.item(0)));
}