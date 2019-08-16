function tabToggle() {
	const donorDashReceipts = document.querySelector('#donor_dash_receipts');
	const donorDashOverview = document.querySelector('#donor_dash_overview');
	const overviewTab = document.querySelector('#overview_tab');
	const receiptTab = document.querySelector('#receipt_tab');

	let prev = overviewTab;

	function switchTab() {
		if (this === prev) return;

		prev.classList.remove('tab_active');
		this.classList.add('tab_active');

		if (this === overviewTab) {
			donorDashReceipts.classList.remove('section_active');
			donorDashOverview.classList.add('section_active');
			localStorage.setItem('tab', 'overview');
		} else if (this === receiptTab) {
			donorDashOverview.classList.remove('section_active');
			donorDashReceipts.classList.add('section_active');
			localStorage.setItem('tab', 'receipt');
		}
		prev = this;
	}

	overviewTab.addEventListener('click', switchTab);
	receiptTab.addEventListener('click', switchTab);
}
export { tabToggle };
