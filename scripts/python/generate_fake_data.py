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
        "%Y/%m/%d",   # YYYY/MM/DD
        
        # Define Spanish date formats
        "%d/%m/%Y",   # DD/MM/YYYY
        "%d-%m-%Y",   # DD-MM-YYYY
        "%d de %B de %Y",  # Day de Month de Year (e.g., 1 de enero de 2022)
        "%d-%m-%y"    # DD-MM-YY        
    ]
    date_format = random.choice(date_formats)
    formatted_date = datetime.datetime.strptime(date, '%Y-%m-%d').strftime(date_format)
    return formatted_date

def generate_fake_data(num_examples, data_type):
    fake = Faker()

    if data_type == "Date":
        return [date_format(fake.date()) for _ in range(num_examples)]
    elif data_type == "Time":
        return [fake.time() for _ in range(num_examples)]
    elif data_type == "Timestamp":
        return [fake.unix_time() for _ in range(num_examples)]
    elif data_type == "Number":
        return [random.randint(1, 1000) for _ in range(num_examples)]
    elif data_type == "Float":
        return [random.uniform(1.0, 1000.0) for _ in range(num_examples)]
    elif data_type == "Boolean":
        return [random.choice([True, False]) for _ in range(num_examples)]
    elif data_type == "IP Address":
        return [fake.ipv4() for _ in range(num_examples)]
    elif data_type == "Email":
        return [fake.email() for _ in range(num_examples)]
    elif data_type == "URI":
        return [fake.uri() for _ in range(num_examples)]
    elif data_type == "Credit Card":
        return [fake.credit_card_number() for _ in range(num_examples)]
    elif data_type == "Phone Number":
        return [fake.phone_number() for _ in range(num_examples)]
    elif data_type == "Zip Code":
        return [fake.zipcode() for _ in range(num_examples)]
    elif data_type == "GUID":
        return [fake.uuid4() for _ in range(num_examples)]
    elif data_type == "SKU":
        return [fake.uuid4() for _ in range(num_examples)]
    elif data_type == "HTML":
        return ['<p>' + fake.text() + '</p>' for _ in range(num_examples)]
    elif data_type == "JSON":
        return [json.dumps({"key": "value"}) for _ in range(num_examples)]
    elif data_type == "Serialized Data":
        return ['a:2:{s:4:"name";s:5:"Alice";s:3:"age";i:30;}' for _ in range(num_examples)]
    elif data_type == "Username":
        return [fake.user_name() for _ in range(num_examples)]
    elif data_type == "Password":
        return [fake.password() for _ in range(num_examples)]
    elif data_type == "Money":
        return [f"${random.uniform(1.0, 1000.0):.2f}" for _ in range(num_examples)]
    else:
        return []

def main():
    parser = argparse.ArgumentParser(description="Generate fake data examples.")
    parser.add_argument("data_type", type=str, help="Type of data to generate")
    parser.add_argument("num_examples", type=int, help="Number of examples to generate for the given data type")
    parser.add_argument("-o", "--output", default="fake_data.txt", help="Output file path (default: fake_data.txt)")
    args = parser.parse_args()

    data = generate_fake_data(args.num_examples, args.data_type)
    with open(args.output, 'w') as f:
        for value in data:
            f.write(str(value) + '\n')
    print("Fake data generated see on ", args.output)

if __name__ == "__main__":
    main()
