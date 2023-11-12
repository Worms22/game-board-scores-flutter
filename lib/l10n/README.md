## l10n

The container of the localized values. If you wish to support a new language than add its file here.

Note: The name of the file should much as following: **app_{language_code}.arb**
e.g: `app_it.arb` etc.

### usage

To be able to use the Localized values than do the following:

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations.of(context).helloWorld;

// or 

import 'package:flutter_structure/features/base/extensions/localizations_extension.dart';

// by `tr` getter

tr.helloWorld // obviously replace helloWorld with your getter [KEY]
```

```json
{
  "helloWorld": "Hello World!"
}
```