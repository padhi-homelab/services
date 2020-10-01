# Services <a href='https://github.com/padhi-homelab/Services/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/Services/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

### Usage

```bash
./service.sh up <svc_dir_name> [<svc_dir_name> ...]
./service.sh down <svc_dir_name> [<svc_dir_name> ...]
```

### Arch. Support

<table>
  <thead>
    <tr>
      <th colspan='4'>&#x2B9F; Services &nbsp; &nbsp; &nbsp; \ &nbsp; &nbsp; &nbsp; Supported Archs &#x2B9E;</th>
      <th>amd64</th>
      <th>i386</th>
      <th>arm/v6</th>
      <th>arm/v7</th>
      <th>arm64</th>
      <th>ppc64le</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        <a href='https://pi-hole.net'>Pi-hole</a>
        <br>
        <small>53, 8443</small>
      </th>
      <th>
        🞅 <br> ✰ <br> 🞅
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/repository/docker/padhihomelab/dnscrypt-proxy'>
          <sub>dnscrypt-proxy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/pihole/pihole'>
          <sub>pihole</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.2.0</sub></code>
        <br>
        <code><sub>2.0.44</sub></code>
        <br>
        <code><sub>v5.1.2</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.netdata.cloud'>Netdata</a>
        <br>
        <small>1234</small>
      </th>
      <th>
        🞅 <br> ❍ <br> ✰
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/docker.sock-proxy'>
          <sub>docker.sock-proxy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/netdata'>
          <sub>netdata</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.2.0</sub></code>
        <br>
        <code><sub>2.2</sub></code>
        <br>
        <code><sub>v1.25.0</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://unifi-network.ui.com'>Unifi</a>
        <br>
        <small>3478, 6789, 8080, 8443, 10001</small>
      </th>
      <th>
        🞅 <br> 🅧
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/mongo'>
          <sub>mongodb</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unifi'>
          <sub>unifi</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>3.6</sub></code>
        <br>
        <code><sub>6.0.20</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://unms.com'>UNMS</a>
        <br>
        <small>80, 81, 443, 2055</small>
      </th>
      <th>
        🅧 <br> ❍ <br> 🞅 <br> 🞅 <br> 🞅 <br> ❍ <br> 🅧 <br> 🅧
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/unms/tags'>
          <sub>netflow</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unms/tags'>
          <sub>nginx</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/postgres'>
          <sub>postgres</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/rabbitmq'>
          <sub>rabbitmq</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/_/redis'>
          <sub>redis</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unms/tags'>
          <sub>siridb</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unms/tags'>
          <sub>ucrm</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/unms'>
          <sub>unms</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>1.2.6</sub></code>
        <br>
        <code><sub>1.19</sub></code>
        <br>
        <code><sub>9.6</sub></code>
        <br>
        <code><sub>3.8</sub></code>
        <br>
        <code><sub>5.0</sub></code>
        <br>
        <code><sub>2.0.38</sub></code>
        <br>
        <code><sub>3.2.7</sub></code>
        <br>
        <code><sub>1.2.6</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <small>8123</small>
      </th>
      <th>
        🞅
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/homeassistant/home-assistant/'>
          <sub>hass</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>0.114.4</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://github.com/misterunknown/ifm//'>IFM</a>
        <br>
        <small>8080</small>
      </th>
      <th>
        ✰
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/ifm/'>
          <sub>ifm</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>0.0-git.829d...</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
    </tr>
  </tbody>
</table>

### Legend

<table>
  <tbody>
    <tr>
      <td>✰</td>
      <td>Dockerfiles maintained by me using binaries compiled from sources</td>
    </tr>
    <tr>
      <td>❍</td>
      <td>Dockerfiles maintained by me, but with pre-compiled binaries from open-source projects</td>
    </tr>
    <tr>
      <td>🞅</td>
      <td>Official dockerfiles (and binaries) from open-source projects</td>
    </tr>
    <tr>
      <td>🞉</td>
      <td>Third-party dockerfiles devoid of closed-source binaries</td>
    </tr>
    <tr>
      <td>🅧</td>
      <td>Dockerfiles containing closed-source binaries (blobs)</td>
    </tr>
  </tbody>
</table>
