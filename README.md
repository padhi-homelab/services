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
      <th colspan='4' align='center'>╭── &nbsp; Services &nbsp; &nbsp; \ &nbsp; &nbsp; Supported Archs &nbsp; ─── </th>
      <th align='center'>amd64</th>
      <th align='center'>386</th>
      <th align='center'>arm/v6</th>
      <th align='center'>arm/v7</th>
      <th align='center'>arm64</th>
      <th align='center'>ppc64le</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>
        <a href='https://www.home-assistant.io/hassio/'>HAss</a>
        <br>
        <sub>8123</sub>
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
        <a href='https://github.com/misterunknown/ifm//'>IFM</a>
        <br>
        <sub>10443</sub>
      </th>
      <th>
        B <br> A
      </th>
      <th align='right'>
        <a href='https://hub.docker.com/_/caddy'>
          <sub>caddy</sub>
        </a>
        <br>
        <a href='https://hub.docker.com/r/padhihomelab/ifm/'>
          <sub>ifm</sub>
        </a>
      </th>
      <td align='center'>
        <code><sub>2.2.1</sub></code>
        <br>
        <code><sub>0.0&#8209;git.829d...</sub></code>
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
        <a href='https://www.netdata.cloud'>Netdata</a>
        <br>
        <sub>1234</sub>
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
        <code><sub>2.2.1</sub></code>
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
        <a href='https://pi-hole.net'>Pi&#8209;hole</a>
        <br>
        <sub>53, 4443</sub>
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
        <code><sub>2.2.1</sub></code>
        <br>
        <code><sub>2.0.44</sub></code>
        <br>
        <code><sub>v5.1.2</sub></code>
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
        <a href='https://www.home-assistant.io/hassio/'>Tang</a>
        <br>
        <sub>23532</sub>
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
        <code><sub>git.2ef4...d6dc&#8209;p1</sub></code>
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
        <code><sub>3.6</sub></code>
        <br>
        <code><sub>6.0.23</sub></code>
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
        <sub>80, 81, 443, 2055</sub>
      </th>
      <th>
        X <br> A <br> B <br> B <br> B <br> A <br> X <br> X
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
        <code><sub>1.2.7</sub></code>
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
        <code><sub>1.2.7</sub></code>
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
  </tbody>
</table>

### Legend

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
