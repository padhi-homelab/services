# Services <a href='https://github.com/padhi-homelab/Services/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/Services/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

### Architecture Support Matrix

<table>
  <thead>
    <tr>
      <th><sub>⬐ Services &nbsp; \ &nbsp; Arch 🠒</sub></th>
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
      <th align='right'><sub>
        <a href='https://hub.docker.com/repository/docker/padhihomelab/cloudflared'>
          cloudflared
          <sup>&#8413;</sup>
        </a>
        +
        <a href='https://hub.docker.com/r/pihole/pihole/'>
          pihole
          <sup>&hairsp;&#9679;&hairsp;</sup>
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
      <th align='right'><sub>
        <a href='https://hub.docker.com/r/padhihomelab/docker.sock-proxy/'>
          docker.sock-proxy
          <sup>&#8413;</sup>
        </a>
        +
        <a href='https://hub.docker.com/r/padhihomelab/netdata/'>
          netdata
          <sup>&#8413;</sup>
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

<sup>&#8413;</sup>&nbsp;
Dockerfiles maintained by me, and services compiled from sources

<sup>&#9938;</sup>&nbsp;
Dockerfiles maintained by me, but use pre-compiled services

<sup>&hairsp;&#9679;&hairsp;</sup>&nbsp;
Dockerfiles **not** maintained by me