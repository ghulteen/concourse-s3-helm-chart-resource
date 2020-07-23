# Concourse S3 Helm Chart Resource

Concourse resource for S3-based helm chart repositories. Piggy-backs on the [helm-s3 plugin](https://github.com/hypnoglow/helm-s3).

## Source Configuration

* `aws_access_key_id`: *Required* The AWS access key to use when accessing the bucket.
* `aws_secret_access_key`: *Required* The AWS secret key to use when accessing the bucket.
* `s3_bucket_name`: *Required* The name of the bucket.
* `s3_bucket_path`: *Required* Repository path in the bucket.
* `chart_name`: *Required* The name of the chart.

## Behaviour

### `check`: Extract versions from repository
Due to a [bug in the helm-s3 plugin](https://github.com/hypnoglow/helm-s3/issues/119),
the AWS CLI is used directly to list the bucket and extract versions.

### `in`: Download a chart from repository
Creates the following files:

* `chart.tgz`: The chart.
* `version`: The chart version.

### `out`: Push a chart to repository
Packages and uploads a chart to S3, updating `index.yaml` in the root of the repository accordingly.

#### Parameters

* `chart`: *Required* The chart directory.
* `version_file`: *Required* File containing chart version.
* `app_version_file`: *Required* File containing app version. 