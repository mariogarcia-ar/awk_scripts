# Data Types

Below are regular expressions for extracting various data types from text using awk:

1. **Numbers**:
```awk
/[0-9]+/
```

2. **Floats**:
```awk
/[0-9]+(\.[0-9]+)?/
```

3. **Emails**:
```awk
/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+/
```

4. **Dates** (MM/DD/YYYY format):
```awk
/[0-1]?[0-9]\/[0-3]?[0-9]\/[0-9]{4}/
```

5. **Times** (HH:MM:SS format, 24-hour clock):
```awk
/[0-2]?[0-9]:[0-5][0-9]:[0-5][0-9]/
```

6. **Monetary Values** (dollars and euros):
```awk
/(\$|€)[0-9]+([.,][0-9]+)?/
```

7. **Boolean** (true or false, case-insensitive):
```awk
/(true|false)/i
```

8. **URLs** (starting with http:// or https://):
```awk
/(http|https):\/\/[^\s]+/
```

9. **File Paths** (Unix-like and Windows paths):
```awk
/\/.*\.[a-zA-Z0-9]+/ || /[A-Za-z]:\\.*\.[a-zA-Z0-9]+/
```

10. **SKU (Stock Keeping Unit)**:
```awk
/[a-zA-Z0-9_-]+/
```

11. **GUID (Globally Unique Identifier)**:
```awk
/[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/
```

12. **Latitude/Longitude** (Decimal degrees format):
```awk
/[+-]?([0-9]|[1-8][0-9]|90)(\.[0-9]+)?, [+-]?([0-9]|[1-9][0-9]|1[0-7][0-9]|180)(\.[0-9]+)?/
```

13. **Timestamp** (Epoch time, seconds since January 1, 1970):
```awk
/[0-9]{10}/
```

These regular expressions provide a basic pattern for extracting each data type. Depending on the specific format and constraints of your data, you may need to adjust these patterns accordingly.


# Examples 
Here are examples demonstrating each data type using awk:

1. **Numbers**:
```bash
echo "The price is 1234." | awk '{ if ($0 ~ /[0-9]+/) print $0 }'
```
Output: `The price is 1234.`

2. **Floats**:
```bash
echo "The temperature is 25.75°C." | awk '{ if ($0 ~ /[0-9]+(\.[0-9]+)?/) print $0 }'
```
Output: `The temperature is 25.75°C.`

3. **Emails**:
```bash
echo "Contact us at support@example.com." | awk '{ if ($0 ~ /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+/) print $0 }'
```
Output: `Contact us at support@example.com.`

4. **Dates** (MM/DD/YYYY format):
```bash
echo "Today's date is 03/31/2024." | awk '{ if ($0 ~ /[0-1]?[0-9]\/[0-3]?[0-9]\/[0-9]{4}/) print $0 }'
```
Output: `Today's date is 03/31/2024.`

5. **Times** (HH:MM:SS format, 24-hour clock):
```bash
echo "The meeting starts at 09:30:00." | awk '{ if ($0 ~ /[0-2]?[0-9]:[0-5][0-9]:[0-5][0-9]/) print $0 }'
```
Output: `The meeting starts at 09:30:00.`

6. **Monetary Values** (dollars and euros):
```bash
echo "The price is $1000 or €850." | awk '{ if ($0 ~ /(\$|€)[0-9]+([.,][0-9]+)?/) print $0 }'
```
Output: `The price is $1000 or €850.`

7. **Boolean** (true or false, case-insensitive):
```bash
echo "The status is TRUE." | awk '{ if ($0 ~ /(true|false)/i) print $0 }'
```
Output: `The status is TRUE.`

8. **URLs** (starting with http:// or https://):
```bash
echo "Visit our website at https://example.com." | awk '{ if ($0 ~ /(http|https):\/\/[^\s]+/) print $0 }'
```
Output: `Visit our website at https://example.com.`

9. **File Paths** (Unix-like and Windows paths):
```bash
echo "The file is located at /path/to/file.txt." | awk '{ if ($0 ~ /\/.*\.[a-zA-Z0-9]+/) print $0 }'
echo "The file is located at C:\path\to\file.txt." | awk '{ if ($0 ~ /[A-Za-z]:\\.*\.[a-zA-Z0-9]+/) print $0 }'
```
Output:
```
The file is located at /path/to/file.txt.
The file is located at C:\path\to\file.txt.
```

10. **SKU (Stock Keeping Unit)**:
```bash
echo "Product SKU: ABC123_xyz-789" | awk '{ if ($0 ~ /[a-zA-Z0-9_-]+/) print $0 }'
```
Output: `Product SKU: ABC123_xyz-789`

11. **GUID (Globally Unique Identifier)**:
```bash
echo "Unique ID: 123e4567-e89b-12d3-a456-426614174000" | awk '{ if ($0 ~ /[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/) print $0 }'
```
Output: `Unique ID: 123e4567-e89b-12d3-a456-426614174000`

12. **Latitude/Longitude** (Decimal degrees format):
```bash
echo "Coordinates: 37.7749° N, -122.4194° W" | awk '{ if ($0 ~ /[+-]?([0-9]|[1-8][0-9]|90)(\.[0-9]+)?, [+-]?([0-9]|[1-9][0-9]|1[0-7][0-9]|180)(\.[0-9]+)?/) print $0 }'
```
Output: `Coordinates: 37.7749° N, -122.4194° W`

13. **Timestamp** (Epoch time, seconds since January 1, 1970):
```bash
echo "Timestamp: 1648788811" | awk '{ if ($0 ~ /[0-9]{10}/) print $0 }'
```
Output: `Timestamp: 1648788811`

These examples demonstrate how each regular expression can be used with awk to extract specific types of data from text.

# Data types formats

## Date format
Here's a list of common date formats:

1. **DD/MM/YYYY** - Day/Month/Year
2. **MM/DD/YYYY** - Month/Day/Year
3. **YYYY/MM/DD** - Year/Month/Day
4. **DD-MM-YYYY** - Day-Month-Year
5. **MM-DD-YYYY** - Month-Day-Year
6. **YYYY-MM-DD** - Year-Month-Day
7. **DD.MM.YYYY** - Day.Month.Year
8. **MM.DD.YYYY** - Month.Day.Year
9. **YYYY.MM.DD** - Year.Month.Day
10. **DD Month YYYY** - Day Month Year (e.g., 31 December 2022)
11. **Month DD, YYYY** - Month Day, Year (e.g., December 31, 2022)
12. **DD Mon YYYY** - Day Mon Year (e.g., 31 Dec 2022)
13. **Mon DD, YYYY** - Mon Day, Year (e.g., Dec 31, 2022)
14. **YYYY Mon DD** - Year Mon Day (e.g., 2022 Dec 31)
15. **Mon DD YYYY** - Mon Day Year (e.g., Dec 31 2022)

These are just a few examples of date formats commonly used in various contexts. The choice of format often depends on regional conventions, organizational preferences, or specific requirements of the application or system handling the dates.

# Time format
Here's a list of common time formats:

1. **HH:MM:SS** - Hours:Minutes:Seconds (24-hour clock)
2. **HH:MM** - Hours:Minutes (24-hour clock)
3. **HH.MM.SS** - Hours.Minutes.Seconds (24-hour clock)
4. **HH.MM** - Hours.Minutes (24-hour clock)
5. **HHMMSS** - HoursMinutesSeconds (24-hour clock)
6. **HHMM** - HoursMinutes (24-hour clock)
7. **HHhMMmSSs** - Hours hours Minutes minutes Seconds seconds
8. **HHhMMm** - Hours hours Minutes minutes
9. **HH:MM:SS AM/PM** - Hours:Minutes:Seconds AM/PM (12-hour clock)
10. **HH:MM AM/PM** - Hours:Minutes AM/PM (12-hour clock)
11. **HH.MM.SS AM/PM** - Hours.Minutes.Seconds AM/PM (12-hour clock)
12. **HH.MM AM/PM** - Hours.Minutes AM/PM (12-hour clock)
13. **HHhMMmSSs AM/PM** - Hours hours Minutes minutes Seconds seconds AM/PM
14. **HHhMMm AM/PM** - Hours hours Minutes minutes AM/PM

These are some examples of time formats commonly used in various contexts. Similar to date formats, the choice of time format often depends on regional conventions, organizational preferences, or specific requirements of the application or system handling the times.

## Timestamp format
A timestamp typically represents a point in time and can vary depending on the context and system. Here are some common formats for timestamps:

1. **Epoch Time**: The number of seconds (or milliseconds) since January 1, 1970, at 00:00:00 UTC (Unix timestamp). This is a numeric format.

2. **ISO 8601**: A standardized date and time representation format. It can include date, time, and time zone information in various combinations. Examples include:
   - `YYYY-MM-DDTHH:MM:SSZ`
   - `YYYY-MM-DD HH:MM:SS`
   - `YYYY-MM-DDTHH:MM:SS±HH:MM`

3. **RFC 2822 / RFC 822**: A format commonly used in email headers. Example: `Tue, 12 Apr 2022 16:21:31 +0000`

4. **Custom Formats**: Timestamps can also be represented in various custom formats specific to applications or systems. Examples include:
   - `DD/MM/YYYY HH:MM:SS`
   - `MM/DD/YYYY HH:MM:SS`
   - `YYYY-MM-DD HH:MM:SS`

5. **Human Readable Formats**: Timestamps may also be represented in human-readable formats, such as:
   - `January 12, 2022, 4:21 PM`
   - `12 Apr 2022, 16:21:31`

These formats can be adjusted and combined to fit specific needs, and the choice of format often depends on factors such as system requirements, data interchange standards, and user preferences.

## Phonenumber Format

Phone numbers can have various formats depending on regional conventions, but here are some common formats:

1. **International Standard (E.164)**: This is a global standard for phone numbers. It starts with a plus sign (+), followed by the country code and the subscriber number. For example: `+1234567890`.

2. **National Format**: This format includes the country code if applicable, followed by the subscriber number, but without the leading plus sign. For example: `123-456-7890` or `(123) 456-7890`.

3. **Local Format**: This format represents phone numbers without country codes or area codes, often used within a single country. Examples include: `456-7890`, `123-4567`, or `555-1234`.

4. **Dotted Decimal Notation**: Sometimes used for phone numbers, similar to IP addresses. For example: `123.456.7890`.

5. **Extensions**: Phone numbers can include extensions, often indicated by a hash (#) or a lowercase "x" followed by the extension number. For example: `123-456-7890#123` or `123-456-7890x123`.

6. **Non-Digit Characters**: Some phone numbers use non-digit characters for readability, such as spaces, dots, dashes, or parentheses. For example: `(123) 456-7890` or `123.456.7890`.

7. **International Dialing Prefix**: In some contexts, phone numbers may include an international dialing prefix (e.g., 011 in North America) before the country code. For example: `011-44-1234567890` for a UK number.

These are just a few examples of phone number formats commonly encountered. The actual format used can vary significantly depending on factors such as country-specific conventions, organizational preferences, and personal habits.


## Zip format
ZIP codes, or postal codes, can vary significantly in format depending on the country. Here are some examples of ZIP code formats used in different regions:

1. **United States ZIP Codes**:
   - Standard ZIP Code: Consists of five digits (e.g., `12345`).
   - ZIP+4 Code: Includes the standard five-digit ZIP code followed by a hyphen and four additional digits for more precise location information (e.g., `12345-6789`).

2. **United Kingdom Postcodes**:
   - Outward Code: Consists of one or two letters followed by one or two digits, and optionally a space, and then one digit and two letters (e.g., `SW1A 1AA`).
   - Inward Code: The second part of the UK postcode, separated from the outward code by a space, consisting of a digit followed by two letters (e.g., `SW1A 1AA`).

3. **Canada Postal Codes**:
   - Standard Postal Code: Consists of six alphanumeric characters arranged in the format `ANA NAN` (e.g., `K1A 0B1`).
   - Urbanization Code: Used in rural areas, this format has the letters "RR" followed by a two-digit number and then the standard postal code format (e.g., `RR 5 STN MAIN, K1A 0B1`).

4. **Australia Postcodes**:
   - Four-Digit Postal Code: Consists of four digits (e.g., `2000` for Sydney CBD).
   - Five-Digit Postal Code: Introduced for more precise locations, consists of a four-digit postal code followed by a hyphen and a single digit (e.g., `2000-1`).

5. **France Postal Codes**:
   - Five-Digit Postal Code: Consists of five digits (e.g., `75001` for the 1st arrondissement of Paris).
   - Five-Digit Postal Code with Cedex: Similar to the standard five-digit code but followed by the letters "CEDEX" and a number indicating the specific postal distribution center (e.g., `75001 CEDEX 01`).

6. **Germany Postleitzahl (PLZ)**:
   - Five-Digit Postal Code: Consists of five digits (e.g., `10115` for Berlin-Mitte).
   - Extended Format: Includes a hyphen and two additional digits (e.g., `10115-1234`).

7. **Japan Postal Codes**:
   - Seven-Digit Postal Code: Consists of seven digits (e.g., `100-0001` for Chiyoda City, Tokyo).
   - Hyphenated Format: Some postal codes use a hyphen to separate the three-digit and four-digit parts (e.g., `100-0001`).

These are just a few examples of ZIP code formats used in different countries. The actual format can vary based on regional postal system requirements and conventions.

# URI format
A URI (Uniform Resource Identifier) is a string of characters used to identify a resource. Here are the components typically found in a URI and their formats:

1. **Scheme**: Indicates the protocol used to access the resource. Common schemes include `http`, `https`, `ftp`, `mailto`, `tel`, `file`, etc. The format is typically alphanumeric followed by a colon (`:`).

2. **Authority**: Specifies the authority responsible for the resource, such as the domain name or IP address for web resources. For example, `example.com` or `user:password@example.com:8080`.

3. **Path**: Specifies the location of the resource within the server's file system hierarchy. It can be a hierarchical sequence of directories and filenames. For example, `/path/to/resource` or `/index.html`.

4. **Query**: Contains data to be passed to the resource, usually in the form of key-value pairs. It starts with a question mark (`?`) followed by parameters separated by ampersands (`&`). For example, `?key1=value1&key2=value2`.

5. **Fragment**: Identifies a specific section within the resource. It starts with a hash (`#`) followed by an identifier. For example, `#section1`.

Here's an example of a complete URI incorporating these components:

```
scheme://authority/path?query#fragment
```

And here are some examples:

- Web URL: `https://www.example.com/index.html?query=example#section1`
- Email URI: `mailto:user@example.com`
- FTP URI: `ftp://ftp.example.com/pub/file.txt`
- Tel URI: `tel:+1234567890`
- File URI: `file:///path/to/file.txt`

These examples demonstrate how different schemes are used in URIs to identify various types of resources on the internet and other networks.

# Reg Exp
- Basic Regular Expressions or BRE 
- Extended Regular Expressions or ERE

https://www.regular-expressions.info/posix.html

The other BRE metacharacters require a backslash to give them their special meaning. The reason is that the oldest versions of UNIX grep did not support these. The developers of grep wanted to keep it compatible with existing regular expressions, which may use these characters as literal characters. The BRE a{1,2} matches a{1,2} literally, while a\{1,2\} matches a or aa. Some implementations support \? and \+ as an alternative syntax to \{0,1\} and \{1,\}, but \? and \+ are not part of the POSIX standard. Tokens can be grouped with \( and \). Backreferences are the usual \1 through \9. Only up to 9 groups are permitted. E.g. \(ab\)\1 matches abab, while (ab)\1 is invalid since there’s no capturing group corresponding to the backreference \1. Use \\1 to match \1 literally.



- date_regex = "(0[1-9]|[12][0-9]|3[01])[-./](0[1-9]|1[0-2])[-./](19|20)[0-9][0-9]"
- time_regex = "([01]?[0-9]|2[0-3]):([0-5][0-9])(:([0-5][0-9]))?( AM| PM)?"
- timestamp_regex = "[0-9]+"
- number_regex = "[0-9]+"
- float_regex = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?"
- boolean_regex = "(true|false)"
- ip_address_regex = "(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])"
- uri_regex = "^((http|https)://)?[a-z0-9]+([-.][a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?$"
- credit_card_regex = "\\b(?:\\d[ -]*?){13,16}\\b"
- phone_number_regex = "^(\\+\\d{1,3}[- ]?)?\\(?\\d{3}\\)?[- ]?\\d{3}[- ]?\\d{4}$"
- zip_code_regex = "\\b\\d{5}\\b"
- guid_regex = "^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$"
- sku_regex = "[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}"
- html_regex = "<([a-zA-Z][a-zA-Z0-9]*)\\b[^>]*>(.*?)</\\1>"
- json_regex = "\\{.*?\\}"
- serialized_data_regex = "a:\\d*:{.*;}"
- username_regex = "^[a-zA-Z0-9_-]{3,16}$"
- password_regex = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
- money_regex = "(\\$|€)[0-9]+([.,][0-9]+)?"

# Credit Card
Common credit card vendor regular expressions:

https://stackoverflow.com/questions/9315647/regex-credit-card-number-tests

- Amex Card: ^3[47][0-9]{13}$
- BCGlobal: ^(6541|6556)[0-9]{12}$
- Carte Blanche Card: ^389[0-9]{11}$
- Diners Club Card: ^3(?:0[0-5]|[68][0-9])[0-9]{11}$
- Discover Card: ^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$
- Insta Payment Card: ^63[7-9][0-9]{13}$
- JCB Card: ^(?:2131|1800|35\d{3})\d{11}$
- KoreanLocalCard: ^9[0-9]{15}$
- Laser Card: ^(6304|6706|6709|6771)[0-9]{12,15}$
- Maestro Card: ^(5018|5020|5038|6304|6759|6761|6763)[0-9]{8,15}$
- Mastercard: ^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$
- Solo Card: ^(6334|6767)[0-9]{12}|(6334|6767)[0-9]{14}|(6334|6767)[0-9]{15}$
- Switch Card: ^(4903|4905|4911|4936|6333|6759)[0-9]{12}|(4903|4905|4911|4936|6333|6759)[0-9]{14}|(4903|4905|4911|4936|6333|6759)[0-9]{15}|564182[0-9]{10}|564182[0-9]{12}|564182[0-9]{13}|633110[0-9]{10}|633110[0-9]{12}|633110[0-9]{13}$
- Union Pay Card: ^(62[0-9]{14,17})$
- Visa Card: ^4[0-9]{12}(?:[0-9]{3})?$
- Visa Master Card: ^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$
