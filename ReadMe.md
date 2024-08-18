Text Extraction App
===================

`text-extraction-app` is a Python-based application designed to extract text from various document formats, including Word, PDF, Excel, image files, and more. The extracted text is then saved as `.txt` files in an output directory, ensuring no data is overwritten by creating unique filenames.

## Features

- Supported File Formats:
  
   - `.docx`, `.doc` - Microsoft Word documents
   - `.pdf` - PDF documents
   - `.xlsx`, `.xlsm`, `.xls` - Microsoft Excel spreadsheets
   - `.msg` - Outlook email messages
   - `.txt` - Plain text files
   - `.png`, `.jpg`, `.jpeg` - Image files (text extraction using OCR)
   - `.zip` - Compressed ZIP files (extracts and processes contained files)

- **Avoids Overwriting:** If an output file with the same name exists, the application creates a new file with a numbered suffix (e.g., `filename(1).txt`).

## Prerequisites

- `Docker` installed on your system.

## Installation

To install and run this application using Docker:

1. **Clone the Repository:**

```bash
    git clone https://github.com/scheffershen/text-extraction-app.git
    cd text-extraction-app
```

2. **Build the Docker Image:**

```bash
    docker build -t text-extraction-app .
```

## Usage 

1. **Prepare Directories**:

- Ensure you have an `input` directory where you place the files you want to process.
- Ensure you have an `output` directory where the extracted text files will be saved.

2. **Run the Docker Container**:
    
    docker run --name text-extraction-app -v ${PWD}/input:/usr/src/app/input -v ${PWD}/output:/usr/src/app/output text-extraction-app

- Replace `${PWD}` with the full path to your working directory if you're not using PowerShell.
- The application will process files in the `input` directory and save the extracted text in the `output` directory.

3. Check the Output:

- Navigate to the `output` directory to find the `.txt` files with the extracted content.
- If a file with the same name already exists, it will create a new file with a numbered suffix to avoid overwriting.

## Example

Suppose you have the following files in your  `input ` directory:

- `document1.docx`
- `image1.png`
- `archive.zip` (containing `report.pdf` and `summary.docx`)

After running the application, the `output` directory will contain:

- `document1.txt` (text extracted from `document1.docx`)
- `image1.txt` (text extracted from `image1.png` using OCR)
- `report.txt` (text extracted from `report.pdf` inside the ZIP)
- `summary.txt` (text extracted from `summary.docx` inside the ZIP)

If any of these files already existed in the `output` directory, they would be saved as `document1(1).txt`, `image1(1).txt`, etc.

## Contributing

Contributions are welcome! Please submit a pull request or create an issue for any features or fixes you would like to see.

## License

This project is licensed under the MIT License - see the LICENSE file for details.