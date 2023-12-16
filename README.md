# firebase_sample

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

database:
user: [
    uid: [
        userInfo: {
            name,
        },
        shared: [ 
            userA, 
            userB 
        ]
    ]
]

categories: [
	uid: [ 
		{
			spendings:[
                '食費',
                '外食費',
                '交通費',
                '衣服',
                '交際費',
                '趣味',
                'その他',
            ]
			income:[
                '給料',
                'その他',
            ]
		}
	]
]

spendings: [
	uid:[
        {
            category,
            memo,
            date,
            money
        },
	]
],

income: [
	uid:[
        {
            category,
            memo,
            date,
            money
        },
	]
]