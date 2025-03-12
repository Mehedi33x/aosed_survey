{{--
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url(https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

        * {
            font-family: "Roboto", sans-serif;
        }

        p {
            padding: 0;
            margin: 0;
            font-size: 9px;
            line-height: 18px;
        }

        .report-header {
            text-align: center;
            font-size: 12px;
            margin-bottom: 15px;
        }

        .report-header .title {
            margin: 0;
            font-size: 15px;
            font-weight: 600;
        }

        .report-header .sub_title {
            padding-top: 6px;
        }

        .table_top_info p {
            line-height: 14px;
        }

        .report-table {
            width: 100%;
            border: 1px solid #e1e1e1;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 10px;
            table-layout: fixed;
        }

        .report-table th,
        .report-table td {
            text-align: center;
            border: 1px solid #e1e1e1;
            padding: 6px 10px;
            font-size: 10px;
            word-wrap: break-word;
        }

        .report-table th {
            background-color: #4b924d;
            color: white;
            text-transform: uppercase;
        }

        .report-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .report-table tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        .report-table td {
            font-size: 9px;
        }

        .report-date {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .table-container {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            background-color: #fff;
            border-radius: 10px;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            font-size: 0.8em;
            margin-bottom: 15px;
        }

        .table-header div {
            flex: 1;
        }

        .table-header .right {
            text-align: right;
        }

        @media print {
            body {
                font-size: 8px;
            }

            .report-header {
                font-size: 10px;
                margin-bottom: 10px;
            }

            .report-table th,
            .report-table td {
                padding: 5px;
                font-size: 8px;
            }

            .table-container {
                box-shadow: none;
                padding: 8px;
            }

            .table-header {
                display: block;
            }

            .table-header div {
                width: 100%;
                margin-bottom: 8px;
            }

            .report-table {
                page-break-after: always;
            }
        }
    </style>
</head>

<body>
    <div class="container my-4">
        <div class="report-header">
            <p class="title">Project Beneficiary Report</p>
            <p class="sub_title">{{ $siteSettings->short_title ?? 'N/A' }}</p>
            <p class="address">{{ $siteSettings->address ?? 'N/A' }}</p>
            <p class="address">
                Phone: {{ $siteSettings->mobile1 ?? 'N/A' }} | Email: {{ $siteSettings->contact_email ?? 'N/A' }}
            </p>
        </div>
        <div class="table-header">
            <div>
                <p><strong>Project:</strong> {{ $searchData['selectedProjectName'] }}</p>
                <p><strong>Indicator:</strong> {{ $searchData['selectedIndicator'] }}</p>
                <p><strong>Activity:</strong> {{ $searchData['selectedActivity'] }}</p>
            </div>
            <div class="right">
                <p><strong>Total Beneficiaries:</strong> {{ count($data) }}</p>
                <p><strong>Report Date:</strong> {{ $searchData['report_date'] }}</p>
            </div>
        </div>
        <div class="table-container">
            <table class="report-table">
                <thead>
                    <tr>
                        <th>Activity</th>
                        <th>Project Name</th>
                        <th>Beneficiary No</th>
                        <th>Beneficiary Name</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Mobile</th>
                        <th>NID</th>
                        <th>Marital Status</th>
                        <th>Occupation</th>
                        <th>Family Member</th>
                        <th>Loan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $report)
                    <tr>
                        <td>{{ ucfirst($report->activity->title ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->project->project_name ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->beneficiary_no ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->full_name ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->gender ?? 'N/A') }}</td>
                        <td>{{ calculateAge($report->beneficiary->date_of_birth) ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->mobile_no ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->nid ?? 'N/A' }}</td>
                        <td>{{ ucfirst($report->beneficiary->marital_status ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->occupations->title ?? 'N/A') }}</td>
                        <td>{{ $report->beneficiary->family_members_count ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->beneficiary_liabilities_sum_amount ?? 'N/A' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
--}}






<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url(https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

        * {
            font-family: "Roboto", sans-serif;
        }

        p {
            padding: 0;
            margin: 0;
            font-size: 11px;
            line-height: 20px;

        }

        .report-header {
            text-align: center;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .report-header .title {
            margin: 0;
            font-size: 17px;
            font-weight: 600;
        }

        .report-header .sub_title {
            padding-top: 6px;
        }

        .table_top_info p {
            line-height: 16px;
        }

        .report-table {
            width: 100%;
            border: 1px solid #000;
            border-collapse: collapse;
        }

        .report-table th,
        .report-table td {
            text-align: center;
            border: 1px solid #000;
            font-size: 12px;
            border-collapse: collapse;
            padding: 2px 5px;
        }

        .report-date {
            margin-bottom: 10px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container my-4">
        <div class="report-header">
            <p class="title">Project Beneficiary Report</p>
            <p class="sub_title">{{ $siteSettings->short_title ?? 'N/A' }}</p>
            <p class="address">{{ $siteSettings->address ?? 'N/A' }}</p>
            <p class="address">
                Phone: {{ $siteSettings->mobile1 ?? 'N/A' }} | Email: {{ $siteSettings->contact_email ?? 'N/A' }}
            </p>
        </div>
        <div
            style="display: flex; justify-content: space-between; align-items: center; font-size: .875em; margin-bottom: 10px;">
            <div class="mx-2" style="flex-grow: 1;">
                <p style="margin-bottom: 5px;"><strong>Project:</strong> {{ $searchData['selectedProjectName'] }}</p>
                <p style="margin-bottom: 5px;"><strong>From Date:</strong> {{ $searchData['selectedIndicator'] }}</p>
                <p style="margin-bottom: 5px;"><strong>To Date:</strong> {{ $searchData['selectedActivity'] }}</p>
            </div>
            <div>
                <p class="mx-2"><strong>Total Beneficiaries:</strong> {{ count($data) }}</p>
                <p class="mx-2 mt-4"><strong>Report Date:</strong> {{ $searchData['report_date'] }}</p>
            </div>
        </div>

        <table class="report-table">
            <thead>
                <tr>
                    <th>Activity</th>
                    <th>Project Name</th>
                    <th>Beneficiary No</th>
                    <th>Beneficiary Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Mobile</th>
                    <th>NID</th>
                    <th>Marital Status </th>
                    <th>Occupation</th>
                    <th>Family Member</th>
                    <th>Loan</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $index => $report)
                    <tr>
                        <td>{{ ucfirst($report->activity->title ?? 'N/A')}}</td>
                        <td>{{ ucfirst($report->project->project_name ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->beneficiary_no ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->full_name ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->beneficiary->gender ?? 'N/A') }}</td>
                        <td>{{ calculateAge($report->beneficiary->date_of_birth) ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->mobile_no ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->nid ?? 'N/A' }}</td>
                        <td>{{ ucfirst($report->beneficiary->marital_status ?? 'N/A') }}</td>
                        <td>{{ ucfirst($report->occupations->title ?? 'N/A')}}</td>
                        <td>{{ $report->beneficiary->family_members_count ?? 'N/A' }}</td>
                        <td>{{ $report->beneficiary->beneficiary_liabilities_sum_amount ?? 'N/A' }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
