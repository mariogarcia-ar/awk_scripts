import csv
import random
import argparse
import glob

# python combine_csv_to_txt.py *.csv output_file.txt 5

def read_csv(file_path):
    data = []
    with open(file_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return data

def shuffle_and_combine(csv_files):
    combined_data = []
    for file_path in csv_files:
        data = read_csv(file_path)
        combined_data.extend(data)
    
    random.shuffle(combined_data)
    
    return combined_data

def write_text_lines(data, output_file, items_per_line):
    with open(output_file, 'w') as txtfile:
        for i in range(0, len(data), items_per_line):
            line = ' '.join(' '.join(row) for row in data[i:i+items_per_line]) + '\n'
            txtfile.write(line)

def main():
    parser = argparse.ArgumentParser(description="Shuffle and combine CSV files into a text file.")
    parser.add_argument("csv_files", nargs='+', help="Paths to the CSV files (you can use wildcard patterns)")
    parser.add_argument("output_file", help="Path for the output TXT file")
    parser.add_argument("items_per_line", type=int, help="Number of items per line in the output file")
    args = parser.parse_args()

    # Use glob to expand wildcard patterns
    csv_files_expanded = []
    for pattern in args.csv_files:
        csv_files_expanded.extend(glob.glob(pattern))

    combined_data = shuffle_and_combine(csv_files_expanded)
    write_text_lines(combined_data, args.output_file, args.items_per_line)
    print("TXT file generated successfully. ", args.output_file)

if __name__ == "__main__":
    main()
