<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url(https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap);

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
            font-size: 17px;
            font-weight: 600;
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
            padding: 2px 5px;
        }
    </style>
</head>

<body>
    <div class="container my-4">
        <div class="report-header">
            <p class="title">Project Summary Report</p>
            <p class="sub_title">{{ $siteSettings->short_title ?? 'N/A' }}</p>
            <p class="address">{{ $siteSettings->address ?? 'N/A' }}</p>
            <p class="address">Phone: {{ $siteSettings->mobile1 ?? 'N/A' }} | Email:
                {{ $siteSettings->contact_email ?? 'N/A' }}
            </p>
        </div>
        <div
            style="display: flex; justify-content: space-between; align-items: end; font-size: .875em; margin-bottom: 10px;">
            {{-- <div class="table_top_info" style="flex-grow: 1;">
                <p>Project: {{ $searchData['selectedProjectName'] }}</p>
                <p>From Date: {{ $searchData['formattedFromDate'] }}</p>
                <p>To Date: {{ $searchData['formattedToDate'] }}</p>
            </div> --}}
            <div>
                {{-- <p class="">Report Date: {{ $searchData['report_date'] }}</p> --}}
            </div>
        </div>
        <!-- New Table -->
        <table id="pdf-table" class="report-table">
            <thead>
                <tr>
                    <th rowspan="2">SL</th>
                    <th rowspan="2">Indicator and Activity</th>
                    <th rowspan="2">Group</th>
                    <th rowspan="2">Execute Date</th>
                    <th rowspan="2">Execute By</th>
                    <th rowspan="2">Beneficiary</th>
                    <th rowspan="2">Attendance</th>
                    <th colspan="4" class="text-center">Survey Info</th>
                </tr>
                <tr class="survey-info">
                    <th>Survey Date</th>
                    <th>Survey Number</th>
                    <th>Attendance</th>
                    <th>Average Mark</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($searchData as $index => $reportItem)
                    <tr>
                        <!-- SL Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">{{ $index + 1 }}</td>

                        <!-- Indicator and Activity Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            Indicator: {{ $reportItem->indicator->title ?? 'N/A' }}<br>
                            Activity: {{ $reportItem->activity->title ?? 'N/A' }}
                        </td>

                        <!-- Group Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            {{ $reportItem->group->title ?? 'N/A' }}
                        </td>

                        <!-- Execute Date Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            {{ $reportItem->execute_date ?? 'N/A' }}
                        </td>

                        <!-- Execute By Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            {{ $reportItem->admin->name ?? 'N/A' }}
                        </td>

                        <!-- Beneficiary Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            {{ $reportItem->total_beneficiary ?? 0 }}
                        </td>

                        <!-- Attendance Column -->
                        <td rowspan="{{ max(1, count($reportItem->surveys ?? [])) }}">
                            {{ $reportItem->beneficiary_attendance[0]->average_attendance ?? 0 }}
                        </td>

                        <!-- Survey Data Columns (First Survey) -->
                        @if (!empty($reportItem->surveys) && count($reportItem->surveys) > 0)
                            <td>{{ $reportItem->surveys[0]->survey_date ?? 'N/A' }}</td>
                            <td>{{ $reportItem->surveys[0]->survey_number ?? 'N/A' }}</td>
                            <td>{{ $reportItem->surveys[0]->survey_beneficiaries[0]->beneficiary_count ?? 0 }}</td>
                            <td>{{ $reportItem->surveys[0]->survey_beneficiaries[0]->average_marks ?? 'N/A' }}</td>
                        @else
                            <td colspan="4" class="text-center">No Survey Data</td>
                        @endif
                    </tr>
                    @if (!empty($reportItem->surveys) && count($reportItem->surveys) > 1)
                        @foreach ($reportItem->surveys as $key => $survey)
                            @if ($key !== 0)
                                <tr>
                                    <td>{{ $survey->survey_date ?? 'N/A' }}</td>
                                    <td>{{ $survey->survey_number ?? 'N/A' }}</td>
                                    <td>{{ $survey->survey_beneficiaries[0]->beneficiary_count ?? 0 }}</td>
                                    <td>{{ $survey->survey_beneficiaries[0]->average_marks ?? 'N/A' }}</td>
                                </tr>
                            @endif
                        @endforeach
                    @endif
                @empty
                    <tr>
                        <td colspan="11" class="text-center" style="background: #fff;">No data found</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
