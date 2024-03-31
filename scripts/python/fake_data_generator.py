import argparse
from faker import Faker
import json
import random
import datetime

def date_format(date):
    # Define a list of date formats
    date_formats = [
        "%Y-%m-%d",   # YYYY-MM-DD
        "%m/%d/%Y",   # MM/DD/YYYY
        "%d-%m-%Y",   # DD-MM-YYYY
        "%Y.%m.%d",   # YYYY.MM.DD
        "%b %d, %Y",  # Month Day, Year (e.g., Jan 1, 2022)
        "%d %b %Y",   # Day Month Year (e.g., 1 Jan 2022)
        "%Y/%m/%d",    # YYYY/MM/DD
        
        # Define Spanish date formats
        "%d/%m/%Y",   # DD/MM/YYYY
        "%d-%m-%Y",   # DD-MM-YYYY
        "%d de %B de %Y",  # Day de Month de Year (e.g., 1 de enero de 2022)
        "%d-%m-%y"    # DD-MM-YY        
    ]
    date_format = random.choice(date_formats)
    formatted_date = datetime.datetime.strptime(date, '%Y-%m-%d').strftime(date_format)
    return formatted_date

def generate_fake_data(num_examples, output_file, shuffle_data, num_per_line):
    fake = Faker()

    # Generate examples for each data type
    data = {
        "Date": [date_format(fake.date()) for _ in range(num_examples)],
        "Time": [fake.time() for _ in range(num_examples)],
        "Timestamp": [fake.unix_time() for _ in range(num_examples)],
        "Number": [random.randint(1, 1000) for _ in range(num_examples)],
        "Float": [random.uniform(1.0, 1000.0) for _ in range(num_examples)],
        "Boolean": [random.choice([True, False]) for _ in range(num_examples)],
        "IP Address": [fake.ipv4() for _ in range(num_examples)],
        "Email": [fake.email() for _ in range(num_examples)],
        "URI": [fake.uri() for _ in range(num_examples)],
        "Credit Card": [fake.credit_card_number() for _ in range(num_examples)],
        "Phone Number": [fake.phone_number() for _ in range(num_examples)],
        "Zip Code": [fake.zipcode() for _ in range(num_examples)],
        "GUID": [fake.uuid4() for _ in range(num_examples)],
        "SKU": [fake.uuid4() for _ in range(num_examples)],
        "HTML": ['<p>' + fake.text() + '</p>' for _ in range(num_examples)],  # Generate paragraphs
        "JSON": [json.dumps({"key": "value"}) for _ in range(num_examples)],
        "Serialized Data": ['a:2:{s:4:"name";s:5:"Alice";s:3:"age";i:30;}' for _ in range(num_examples)],
        "Username": [fake.user_name() for _ in range(num_examples)],
        "Password": [fake.password() for _ in range(num_examples)],
        "Money": [f"${random.uniform(1.0, 1000.0):.2f}" for _ in range(num_examples)],
    }

    # Shuffle data if required
    if shuffle_data:
        __shuffled_data = []
        for _ in range(num_examples):
            data_type = random.choice(list(data.keys()))
            __shuffled_data.append(random.choice(data[data_type]))
        random.shuffle(__shuffled_data)

        # Determine the number of lines
        num_lines = len(__shuffled_data) // num_per_line + (1 if len(__shuffled_data) % num_per_line != 0 else 0)

        # Generate lines
        shuffled_data = [__shuffled_data[i*num_per_line:(i+1)*num_per_line] for i in range(num_lines)]


    # Write data to file
    with open(output_file, 'w') as file:
        if shuffle_data:
            for value in shuffled_data:
                file.write(f"{value}\n")
                # file.write(" ".join(map(str, line)) + "\n")
        else:
            for key, values in data.items():
                file.write(f"{key}:\n")
                for value in values:
                    file.write(f"{value}\n")
                file.write("\n")

def main():
    parser = argparse.ArgumentParser(description="Generate fake data examples.")
    parser.add_argument("num_examples", type=int, help="Number of examples to generate for each data type")
    parser.add_argument("-o", "--output", default="fake_data.txt", help="Output file path (default: fake_data.txt)")
    parser.add_argument("-s", "--shuffle", action="store_true", help="Shuffle data before writing to file")
    parser.add_argument("-n", "--num-per-line", type=int, default=5, help="Number of data types per line (default: 5)")
    args = parser.parse_args()

    if args.num_examples % args.num_per_line != 0:
        print("Error: The number of data types per line must be a divisor of the total number of examples.")
        return

    generate_fake_data(args.num_examples, args.output, args.shuffle, args.num_per_line)

if __name__ == "__main__":
    main()
