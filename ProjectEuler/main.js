var butt0 = document.querySelector('#butt0');
var result = document.querySelector('#result');

var calcul = function(count) {
	var total = 0;
	for (cntr = 0; cntr < count; ++cntr) {
		if (cntr % 3 === 0 || cntr % 5 === 0) {
			total += cntr;
		}
		}
result.textContent = total;
}
