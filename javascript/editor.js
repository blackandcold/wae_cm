var myEditor = new YAHOO.widget.Editor('content', {
    height: '300px',
    width: '600px',
	handleSubmit: true,
    dompath: true, //Turns on the bar at the bottom
	_disabled: [
	],
	buttons: [
	    { group: 'fontstyle', label: 'Font Name and Size',
	        buttons: [
	            { type: 'select', label: 'Arial', value: 'fontname', disabled: true,
	                menu: [
	                    { text: 'Arial', checked: true },
	                    { text: 'Arial Black' },
	                    { text: 'Comic Sans MS' },
	                    { text: 'Courier New' },
	                    { text: 'Lucida Console' },
	                    { text: 'Tahoma' },
	                    { text: 'Times New Roman' },
	                    { text: 'Trebuchet MS' },
	                    { text: 'Verdana' }
	                ]
	            },
	            { type: 'spin', label: '13', value: 'fontsize', range: [ 9, 75 ], disabled: true }
	        ]
	    },
	    { type: 'separator' },
	    { group: 'textstyle', label: 'Font Style',
	        buttons: [
	            { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
	            { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
	            { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
	            { type: 'separator' },
	            { type: 'color', label: 'Font Color', value: 'forecolor', disabled: false },
	            { type: 'color', label: 'Background Color', value: 'backcolor', disabled: false }
	        ]
	    },
	    { type: 'separator' },
	    { group: 'indentlist', label: 'Lists',
	        buttons: [
	            { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
	            { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
	        ]
	    },
	    { type: 'separator' },
	    { group: 'insertitem', label: 'Insert Item',
	        buttons: [
	            { type: 'push', label: 'HTML Link CTRL + SHIFT + L', value: 'createlink', disable: false },
	            { type: 'push', label: 'Insert Image', value: 'insertimage' }
	        ]
	    }
	]
});
myEditor.render();