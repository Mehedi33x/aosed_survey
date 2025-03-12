<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url(https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);
        *{
            font-family: "Roboto", sans-serif;
        }
        p{
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
            <p class="title">Project Summary Report</p>
            <p class="sub_title">{{ $siteSettings->short_title ?? 'N/A' }}</p>
            <p class="address">{{ $siteSettings->address ?? 'N/A' }}</p>
            <p class="address">
                Phone: {{ $siteSettings->mobile1 ?? 'N/A' }} | Email: {{ $siteSettings->contact_email ?? 'N/A' }}
            </p>
        </div>
        <div
            style="display: flex; justify-content: space-between; align-items: end; font-size: .875em; margin-bottom: 10px;">
            <div class="table_top_info" style="flex-grow: 1;">
                <p>Project: {{ $searchData['selectedProjectName'] }}</p>
                <p>From Date: {{ $searchData['formattedFromDate'] }}</p>
                <p>To Date: {{ $searchData['formattedToDate'] }}</p>
            </div>
            <div>
                <p class="">Report Date: {{ $searchData['report_date'] }}</p>
            </div>
        </div>
        <!-- Table -->
        <table class="report-table">
            <thead>
                <tr>
                    <th style="width:10%; text-align:left;">Project Date</th>
                    <th style="width:20%; text-align:left;">Project</th>
                    <th style="width:10%; text-align:center;">Total Indicators</th>
                    <th style="width:10%; text-align:center;">Total Activities</th>
                    <th style="width:10%; text-align:center;">Executed Activities</th>
                    <th style="width:10%; text-align:center;">Total Beneficiaries</th>
                    <th style="width:15%; text-align:center;">Target Achievement</th>
                    <th style="width:15%; text-align:center;">Earned Achievement</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($data as $report)
                    <tr>
                        <td>{{ $report->start_date ?? 'N/A' }}</td>
                        <td>{{ $report->project_name ?? 'N/A' }}</td>
                        <td>{{ $report->total_indicators ?? 0 }}</td>
                        <td>{{ $report->total_activities ?? 0 }}</td>
                        <td>{{ $report->execute_activity ?? 0 }}</td>
                        <td>{{ $report->total_beneficiaries ?? 0 }}</td>
                        <td>{{ $report->target_achievement ?? 0 }}</td>
                        <td>{{ number_format($report->projectAchievementViews->first()->achievement ?? 0, 2) }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="6" class="text-center">No data found</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
