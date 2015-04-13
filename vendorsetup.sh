#!/bin/bash
COMBOS()
{
find vendor/exodus/products -name exodus_*.mk | while read FILE; do basename $FILE .mk | sed 's/exodus\_//g'; done
}
for x in `COMBOS | sort -h`; do
  ## ordered based on testicular circumference: decreasing
  add_lunch_combo exodus_$x-eng
  add_lunch_combo exodus_$x-userdebug
  add_lunch_combo exodus_$x-user
done