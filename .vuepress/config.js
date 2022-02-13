const {
    description
} = require('../package')

module.exports = {
    title: 'Getting Started With ACPI',
    head: [
        ['meta', {
            name: 'theme-color',
            content: '#3eaf7c'
        }],
        ['meta', {
            name: 'apple-mobile-web-app-capable',
            content: 'yes'
        }],
        ['meta', {
            name: 'apple-mobile-web-app-status-bar-style',
            content: 'black'
        }],
        ["link", {
            rel: "'stylesheet",
            href: "/styles/website.css"
        },]
    ],
    base: '/Getting-Started-With-ACPI/',

	watch: {
	    $page(newPage, oldPage) {
	      if (newPage.key !== oldPage.key) {
	        requestAnimationFrame(() => {
	          if (this.$route.hash) {
	            const element = document.getElementById(this.$route.hash.slice(1));

	            if (element && element.scrollIntoView) {
	              element.scrollIntoView();
	            }
	          }
	        });
	      }
	    }
	  },
	
	markdown: {
		extendMarkdown: md => {
			md.use(require('markdown-it-multimd-table'), {
				rowspan: true,
			});
		}
	},

    /**
     * Theme configuration, here is the default theme configuration for VuePress.
     *
     * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
     */
    theme: 'vuepress-theme-succinct',
    globalUIComponents: [
        'ThemeManager'
    ],

    themeConfig: {
        lastUpdated: true,
        repo: 'https://github.com/dortania/Getting-Started-With-ACPI',
        editLinks: true,
        editLinkText: 'Help us improve this page!',
        logo: 'homepage.png',
        nav: [{
            text: 'Dortania Guides',
            ariaLabel: 'Language Menu',
            items: [{
                text: 'Home Site',
                link: 'https://dortania.github.io/'
            },
            {
                text: 'OpenCore Install Guide',
                link: 'https://dortania.github.io/OpenCore-Install-Guide/'
            },
            {
                text: 'OpenCore Post-Install',
                link: 'https://dortania.github.io/OpenCore-Post-Install/'
            },
            {
                text: 'Wireless Buyers Guide',
                link: 'https://dortania.github.io/Wireless-Buyers-Guide/'
            },
            {
                text: 'GPU Buyers Guide',
                link: 'https://dortania.github.io/GPU-Buyers-Guide/'
            },
            {
                text: 'Anti Buyers Guide',
                link: 'https://dortania.github.io/Anti-Hackintosh-Buyers-Guide/'
            },
            ]
        },
        ],
        sidebar: [{
            title: 'Introduction',
            collapsable: false,
            sidebarDepth: 1,
            children: [
                ['', 'Getting Started With ACPI'],
				['ssdt-platform', 'Choosing the SSDTs'],
            ]

        },
        {
            title: 'Methods',
            collapsable: false,
            sidebarDepth: 2,
            children: [
                '/ssdt-methods/ssdt-methods',
		        {
		            title: 'Methods',
		            collapsable: false,
		            sidebarDepth: 2,
		            children: [
		                '/ssdt-methods/ssdt-prebuilt',
						'/ssdt-methods/ssdt-easy',
						'/ssdt-methods/ssdt-long',
		            ]
		        },
            ]
        },
        {
            title: 'Manual',
            collapsable: false,
            sidebarDepth: 1,
            children: [
                '/Manual/dump',
                '/Manual/compile',
            ]
        },
        {
            title: 'Desktop',
            collapsable: false,
            sidebarDepth: 1,
            children: [
                ['/Desktops/desktop-disable', 'Disabling desktop dGPUs'],
            ]
        },
        {
            title: 'Laptop',
            collapsable: false,
            sidebarDepth: 0,
            children: [
                ['/Laptops/backlight', 'Fixing Backlight'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Laptops/backlight-methods/prebuilt', 'Prebuilt'],
		                ['/Laptops/backlight-methods/manual', 'Manual'],
		            ]
		        },
                ['/Laptops/trackpad', 'Fixing Trackpad'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Laptops/trackpad-methods/manual', 'Manual'],
		            ]
		        },
				['/Laptops/laptop-disable', 'Disabling laptop dGPUs'],
            ]
        },
        {
            title: 'Universal',
            collapsable: false,
            sidebarDepth: 0,
            children: [
                ['/Universal/ec-fix', 'Embedded Controller'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/ec-methods/prebuilt', 'Prebuilt'],
						['/Universal/ec-methods/ssdttime', 'SSDTTime'],
		                ['/Universal/ec-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/plug', 'CPU Power Management'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/plug-methods/prebuilt', 'Prebuilt'],
						['/Universal/plug-methods/ssdttime', 'SSDTTime'],
		                ['/Universal/plug-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/plug-alt', 'CPU Power Management and Processor Definition'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/plug-alt-methods/prebuilt', 'Prebuilt'],
		                ['/Universal/plug-alt-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/awac', 'AWAC vs RTC'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/awac-methods/prebuilt', 'Prebuilt'],
		                ['/Universal/awac-methods/ssdttime', 'SSDTTime'],
		                ['/Universal/awac-methods/manual', 'Manual'],
						['/Universal/awac-methods/manual-hedt', 'Manual HEDT'],
		            ]
		        },
                ['/Universal/nvram', 'NVRAM PMC'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/nvram-methods/prebuilt', 'Prebuilt'],
		                ['/Universal/nvram-methods/ssdttime', 'SSDTTime'],
		                ['/Universal/nvram-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/rhub', 'USB RHUB'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/rhub-methods/prebuilt', 'Prebuilt'],
						['/Universal/rhub-methods/ssdttime', 'SSDTTime'],
		                ['/Universal/rhub-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/imei', 'IMEI'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/imei-methods/prebuilt', 'Prebuilt'],
		                ['/Universal/imei-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/unc0', 'Fixing Uncore Bridge'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
						['/Universal/unc0-methods/prebuilt', 'Prebuilt'],
		                ['/Universal/unc0-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/smbus', 'Fixing SMBus Support'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/smbus-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/brg0', 'Fixing Property Injection'],
		        {
					title: 'Methods',
		            collapsable: true,
		            sidebarDepth: 2,
		            children: [
		                ['/Universal/brg0-methods/manual', 'Manual'],
		            ]
		        },
                ['/Universal/irq', 'IRQ Fix'],
				['/Universal/spoof', 'GPU Spoof'],
            ]
        },
        {
            title: 'Cleanup',
            collapsable: false,
            sidebarDepth: 1,
            children: [
                ['cleanup', 'Cleanup'],
            ]
        },
        {
            title: 'Misc',
            collapsable: false,
            sidebarDepth: 1,
            children: [
                ['troubleshooting', 'Troubleshooting'],
				['CONTRIBUTING', 'Contributing'],
            ]
        },
    	],
    },
    /**
     * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
     */
    plugins: [
        '@vuepress/plugin-back-to-top',
        'vuepress-plugin-smooth-scroll',
        ['vuepress-plugin-medium-zoom',
            {
                selector: "img",
                options: {
                    background: 'var(--bodyBgColor)'
                }
            }],
    ]
}
