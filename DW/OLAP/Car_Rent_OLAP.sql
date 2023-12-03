-- Calculate the average income for each year and rank the years based on the descending order of average income.

SELECT YEAR(w.tanggal) AS tahun,
       AVG(fp.pendapatan) AS avg_income,
       RANK() OVER (ORDER BY AVG(fp.pendapatan) DESC) AS rank_avg_income
FROM fakta_pendapatan fp
JOIN waktu w ON fp.idWAKTU = w.idWAKTU
GROUP BY tahun;

-- Calculate the total revenue generated by each car brand and rank the brands based on the descending order of total revenue

SELECT m.brand,
       sum(fp.pendapatan) AS total_pendapatan,
       DENSE_RANK() OVER (ORDER BY sum(fp.pendapatan) DESC) AS dense_rank_pendapatan
FROM fakta_pendapatan fp
JOIN mobil m ON fp.idMOBIL = m.idMOBIL
GROUP BY m.brand;

-- Retrieve and organize financial transaction data, grouping by branch and month, while assigning a row number for each branch-month combination

SELECT ROW_NUMBER() OVER (PARTITION BY l.cabang ORDER BY date_format(w.TANGGAL,'%Y-%m')) AS nomor_urut,
       date_format(w.TANGGAL,'%Y-%m') AS bulan,
       l.cabang
FROM fakta_pendapatan fp
JOIN waktu w ON fp.idWAKTU = w.idWAKTU
JOIN lokasi l ON fp.idLOKASI = l.idLOKASI
GROUP BY
  l.cabang,
  date_format(w.TANGGAL,'%Y-%m')
ORDER BY
  bulan,
  nomor_urut;

-- Generate a table that shows the total revenue for each month in the year 2023, as well as the total revenue for the entire year

SELECT YEAR(w.tanggal) AS tahun,
       MONTH(w.TANGGAL) AS bulan,
       SUM(fp.pendapatan) AS total_pendapatan
FROM fakta_pendapatan fp
JOIN waktu w ON fp.idwaktu = w.idwaktu
WHERE  YEAR(w.tanggal) = 2023
GROUP BY bulan WITH ROLLUP;

