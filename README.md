# Obtain the last artifact uploaded

[![Local checks](https://github.com/JJ/gha-get-last-artifact/actions/workflows/test.yml/badge.svg)](https://github.com/JJ/gha-get-last-artifact/actions/workflows/test.yml)

This action downloads the last version of the artifact with the indicated
name, placing it in the original path.

## Use

```yaml
    - id: running-tests
      name: Run local tests
      uses: JJ/gha-get-last-artifact@v1
      with:
        artifact-name: last_run_id
    - name: Show all files and retrieve content of the file
      run: ls -alt && cat last_run_id
```

Previously, you will need to have done something like

```
    - name: Upload test artifact
      uses: actions/upload-artifact@v4
      with:
        name: last_run_id
        path: last_run_id
```

Use case for this? Essentially, keep state from one run to the next, although
remember that artifacts are kept only for 90 days. Could be used, for instance,
for

- Check test coverage of the last run (some coverage online tools do this for
  you anyway)
- Store some kind of repo stats, like the last day a workflow was run (you can
  do that via the API, but this is an easy way to do the same).
- Simply store state between runs.

## Issues? PRs?

You know where to find them.

## License

(c) JJ Merelo, 2024

Licensed under GPL v3. See [LICENSE](LICENSE) for details.
