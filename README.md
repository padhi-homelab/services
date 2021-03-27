# Services

### Usage

```console
$ ./service.sh 
Usage: ./service.sh <verb> [flags] <svc_dir_name> [<svc_dir_name> ...]

Verbs:
  clean                     Delete `service/data`
  down                      Stop a service
  restart                   Restart a service
  up                        Start a service

Flags:
  [--ignore-failures, -i]   Ignore failing services and continue
  [--no-hook-scripts, -s]   Ignore all pre and post hook scripts
  [--no-override, -o]       Ignore docker-compose.override.yml file

Services:
  hass  netdata  nzbget  pihole  qbittorrent  tang	trackarr  unifi
```

### Arch. Support

<table>
  <thead>
    <tr>
      <th colspan='4' align='center'>╭── &nbsp; Services &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
      <th align='center'><sub>amd64</sub></th>
      <th align='center'><sub>386</sub></th>
      <th align='center'><sub>arm/v6</sub></th>
      <th align='center'><sub>arm/v7</sub></th>
      <th align='center'><sub>arm64</sub></th>
      <th align='center'><sub>ppc64le</sub></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <sub>8123</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28HAss%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(HAss)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B
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
        <a href='https://www.netdata.cloud'>netdata</a>
        <br>
        <sub>1234</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28netdata%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(netdata)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> C <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/docker.sock-proxy'>
          <sub>docker.sock&#8209;proxy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/netdata'>
          <sub>netdata</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>2.3</sub></code>
        <br>
        <code><sub>1.29.3</sub></code>
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
        <a href='https://nzbget.net/'>nzbget</a>
        <br>
        <sub>6789</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28nzbget%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(nzbget)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> A <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/nzbget/'>
          <sub>nzbget</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>2.5.0</sub></code>
        <br>
        <code><sub>21.0</sub></code>
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
        <a href='https://pi-hole.net'>Pi&#8209;hole</a>
        <br>
        <sub>53, 4443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28PiHole%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(PiHole)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> A <br> B
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/repository/docker/padhihomelab/dnscrypt-proxy'>
          <sub>dnscrypt&#8209;proxy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/pihole/pihole'>
          <sub>pihole</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>2.0.45</sub></code>
        <br>
        <code><sub>5.7</sub></code>
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
        <br>
        :heavy_multiplication_x:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://www.qbittorrent.org/'>qBittorrent</a>
        <br>
        <sub>8443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28qBittorrent%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(qBittorrent)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> A <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client/'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/qbittorrent-nox/'>
          <sub>qbittorrent&#8209;nox</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>2.5.0</sub></code>
        <br>
        <code><sub>4.3.1</sub></code>
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
        Trackarr
        <br>
        <sub>9443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Trackarr%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Trackarr)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> C <br> C <br> C
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/radarr/'>
          <sub>jackett</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/radarr/'>
          <sub>radarr</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/radarr/'>
          <sub>sonarr</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>0.17.790</sub></code>
        <br>
        <code><sub>3.0.2.4552</sub></code>
        <br>
        <code><sub>3.0.5.1143</sub></code>
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
      </td>
      <td align='center'>
        :heavy_check_mark:
        <br>
        :heavy_check_mark:
        <br>
        :heavy_multiplication_x:
        <br>
        :heavy_check_mark:
      </td>
    </tr>
    <tr>
      <th>
        <a href='https://github.com/latchset/tang'>Tang</a>
        <br>
        <sub>23532</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Tang%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Tang)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/r/padhihomelab/tang/'>
          <sub>tang</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>git.95d4...</sub></code>
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
    <tr>
      <th>
        <a href='https://unifi-network.ui.com'>Unifi</a>
        <br>
        <sub>3478, 6789, 8080, 8443, 10001</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28Unifi%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(Unifi)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> X
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
        <code><sub>4.2.9</sub></code>
        <br>
        <code><sub>6.0.45</sub></code>
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
        <a href='https://github.com/Tzahi12345/YoutubeDL-Material'>YTDL</a>
        <br>
        <sub>10443</sub>
        <hr>
        <a href='https://github.com/padhi-homelab/services/actions?query=workflow%3A%22Docker+Compose+Test+%28ytdl%29%22'><img src='https://img.shields.io/github/workflow/status/padhi-homelab/services/Docker%20Compose%20Test%20(ytdl)?logo=github&logoWidth=24&style=flat-square&label=tests'></img></a>
      </th>
      <th>
        B <br> A <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/openvpn-client'>
          <sub>openvpn&#8209;client</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/ytdl'>
          <sub>ytdl</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.3.0</sub></code>
        <br>
        <code><sub>2.3</sub></code>
        <br>
        <code><sub>git.addd...</sub></code>
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
  </tbody>
</table>

#### Legend

<table>
  <tbody>
    <tr>
      <td>A</td>
      <td>Dockerfiles with application binaries compiled from sources</td>
    </tr>
    <tr>
      <td>B</td>
      <td>Official dockerfiles (and binaries) from open-source projects</td>
    </tr>
    <tr>
      <td>C</td>
      <td>Dockerfiles with pre-compiled binaries from open-source projects</td>
    </tr>
    <tr>
      <td>X</td>
      <td>Dockerfiles containing closed-source binaries (blobs)</td>
    </tr>
  </tbody>
</table>

### Structure

- directories within `config/`, `data/` and `extra/` should match the service name within `docker-compose.yml`
- the directory structure within each `config/`, `data/`, `extra/` service subdirectory should match the target root directory hierarchy
- `config/` contents:
  - files should be mounted in read-only mode (`:ro`)
  - _should_ be checked in
- `data/` contents:
  - files should be mounted in read+write mode (`:rw`)
  - should _not_ be checked in -- present in `.gitignore`
- `extra/` contents:
  - files should _not_ mounted within containers!
  - these are additional files relevant to various services
  - _should_ be checked in
