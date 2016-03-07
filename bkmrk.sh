createdb bkmrk_site;
psql -d bkmrk_site -f bkmrk_table_create_then_select.sql
for file in specs/*.rb; do echo "#########################"; echo $file; ruby $file; echo $file; echo "#########################"; done
ruby bkmrk_controller.rb