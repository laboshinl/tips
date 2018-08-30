#!/bin/bash
gitbook epub
gitbook pdf
ebook-convert book.epub book.docx


