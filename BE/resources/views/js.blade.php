<script>
    const KTAppOptions = function() {
        let datatable;

        function formatCurrency(number) {
            if (number >= 1000000000) {
                return (number / 1000000000).toFixed(2).replace(/\.00$/, '') + ' tỷ';
            } else if (number >= 1000000) {
                return (number / 1000000).toFixed(2).replace(/\.00$/, '') + ' triệu';
            } else if (number >= 1000) {
                return (number / 1000).toFixed(2).replace(/\.00$/, '') + ' nghìn';
            } else {
                return number.toFixed(2).replace(/\.00$/, '') + ' đồng';
            }
        }

        let chartSales = {
            self: null,
            rendered: false
        };

        const initSalePerDay = function(chart) {
            const days = @json($sales['days']);
            const revenue = @json($sales['revenue']);
            const maxRevenue = Math.max(...revenue);
            const threshold = maxRevenue * 1.1;

            const element = document.getElementById("charts_sale_per_day");

            if (!element) {
                return;
            }

            const height = parseInt(KTUtil.css(element, 'height'));
            const labelColor = KTUtil.getCssVariableValue('--bs-gray-500');
            const borderColor = KTUtil.getCssVariableValue('--bs-border-dashed-color');
            const baseColor = KTUtil.getCssVariableValue('--bs-success');
            const lightColor = KTUtil.getCssVariableValue('--bs-success');

            const options = {
                series: [{
                    name: 'Doanh thu',
                    data: revenue
                }],
                chart: {
                    fontFamily: 'inherit',
                    type: 'area',
                    height: height,
                    toolbar: {
                        show: false
                    }
                },
                plotOptions: {

                },
                legend: {
                    show: false
                },
                dataLabels: {
                    enabled: false
                },
                fill: {
                    type: "gradient",
                    gradient: {
                        shadeIntensity: 1,
                        opacityFrom: 0.4,
                        opacityTo: 0,
                        stops: [0, 80, 100]
                    }
                },
                stroke: {
                    curve: 'smooth',
                    show: true,
                    width: 3,
                    colors: [baseColor]
                },
                xaxis: {
                    categories: days,
                    axisBorder: {
                        show: false,
                    },
                    axisTicks: {
                        show: false
                    },
                    tickAmount: 6,
                    labels: {
                        rotate: 0,
                        rotateAlways: true,
                        style: {
                            colors: labelColor,
                            fontSize: '12px'
                        }
                    },
                    crosshairs: {
                        position: 'front',
                        stroke: {
                            color: baseColor,
                            width: 1,
                            dashArray: 3
                        }
                    },
                    tooltip: {
                        enabled: true,
                        formatter: undefined,
                        offsetY: 0,
                        style: {
                            fontSize: '12px'
                        }
                    }
                },
                yaxis: {
                    tickAmount: 8,
                    max: threshold,
                    min: 0,
                    labels: {
                        style: {
                            colors: labelColor,
                            fontSize: '12px'
                        },
                        formatter: function(val) {
                            return formatCurrency(val)
                        }
                    }
                },
                states: {
                    normal: {
                        filter: {
                            type: 'none',
                            value: 0
                        }
                    },
                    hover: {
                        filter: {
                            type: 'none',
                            value: 0
                        }
                    },
                    active: {
                        allowMultipleDataPointsSelection: false,
                        filter: {
                            type: 'none',
                            value: 0
                        }
                    }
                },
                tooltip: {
                    style: {
                        fontSize: '12px'
                    },
                    y: {
                        formatter: function(val) {
                            return formatCurrency(val)
                        }
                    }
                },
                colors: [lightColor],
                grid: {
                    borderColor: borderColor,
                    strokeDashArray: 4,
                    yaxis: {
                        lines: {
                            show: true
                        }
                    }
                },
                markers: {
                    strokeColor: baseColor,
                    strokeWidth: 3
                }
            };

            chart.self = new ApexCharts(element, options);

            setTimeout(function() {
                chart.self.render();
                chart.rendered = true;
            }, 200);
        }

        return {
            init: function() {
                initSalePerDay(chartSales);
                KTThemeMode.on("kt.thememode.change", function() {
                    if (chartSales.rendered) {
                        chartSales.self.destroy();
                    }

                    initSalePerDay(chartSales);
                });
            }
        }
    }();

    KTUtil.onDOMContentLoaded(function() {
        KTAppOptions.init();
    });
</script>
