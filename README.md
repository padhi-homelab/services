# Services <a href='https://github.com/padhi-homelab/Services/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/Services/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

### Architecture Support Matrix

<table>
  <thead>
    <tr>
      <th><sub>Services &nbsp; \ &nbsp; Arch</sub></th>
      <th><sub>amd64</sub></th>
      <th><sub>i386</sub></th>
      <th><sub>arm/v6</sub></th>
      <th><sub>arm/v7</sub></th>
      <th><sub>arm64</sub></th>
      <th><sub>ppc64le</sub></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th align='left'><sub>
        <a href='https://hub.docker.com/repository/docker/padhihomelab/dnscrypt-proxy'>
          ⓪ dnscrypt-proxy [2.0.44]
        </a>
        <br>
        <a href='https://hub.docker.com/r/pihole/pihole/'>
          ② pihole [v5.0]
        </a>
      </sub></th>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_multiplication_x:</sub>
        <br>
        <sub>[ :heavy_multiplication_x: :heavy_check_mark: ]</sub>
      </td>
      <td align='center'>
        <sub>:heavy_multiplication_x:</sub>
        <br>
        <sub>[ :heavy_multiplication_x: :heavy_check_mark: ]</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_multiplication_x:</sub>
        <br>
        <sub>[ :heavy_multiplication_x: :heavy_multiplication_x: ]</sub>
      </td>
    </tr>
    <tr>
      <th align='left'><sub>
        <a href='https://hub.docker.com/r/padhihomelab/docker.sock-proxy/'>
          ① docker.sock-proxy [2.2]
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/netdata/'>
          ⓪ netdata [v1.23.1]
        </a>
      </sub></th>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
      <td align='center'>
        <sub>:heavy_check_mark:</sub>
      </td>
    </tr>
  </tbody>
</table>

⓪&nbsp;
Dockerfiles maintained by me using binaries compiled from sources
<br>
①&nbsp;
Dockerfiles maintained by me, but with pre-compiled binaries from open-source projects
<br>
②&nbsp;
Official dockerfiles (and binaries) from  open source projects
<br>
❸&nbsp;
Third-party dockerfiles devoid of closed-source binaries
<br>
🅧&nbsp;
Dockerfiles containing closed-source binaries (blobs)
