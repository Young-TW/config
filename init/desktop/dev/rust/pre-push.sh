#!/bin/bash

echo "Running cargo build..."
cargo build
if [ $? -ne 0 ]; then
  echo "cargo build failed. Push aborted."
  exit 1
fi

echo "Running cargo test..."
cargo test
if [ $? -ne 0 ]; then
  echo "cargo test failed. Push aborted."
  exit 1
fi

echo "Running cargo run..."
cargo run
if [ $? -ne 0 ]; then
  echo "cargo run failed. Push aborted."
  exit 1
fi

echo "All checks passed. Proceeding with push."
exit 0
