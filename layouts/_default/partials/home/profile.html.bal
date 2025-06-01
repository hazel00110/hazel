{{ $disableImageOptimization := .Site.Params.disableImageOptimization | default false }}
<article class="{{ if not .Site.Params.homepage.showRecent }} h-full {{ end }} flex flex-col items-center justify-center text-center">
  <header class="relative w-full px-6 py-10 flex flex-col lg:flex-row items-center justify-center gap-6 max-w-6xl mx-auto">
    
    <!-- SIDEBAR (Image + Bio) -->
    <div class="w-full lg:w-1/3 py-6 rounded-2xl flex flex-col items-center text-center border">
      {{ with .Site.Params.Author.image }}
        {{ $authorImage := "" }}
        {{ if or (strings.HasPrefix . "http:") (strings.HasPrefix . "https:") }}
          {{ $authorImage = resources.GetRemote . }}
        {{ else }}
          {{ $authorImage = resources.Get . }}
        {{ end }}
        {{ if $authorImage }}
          {{ if not $disableImageOptimization }}
            {{ $authorImage = $authorImage.Fill (print "1080x1080 q" ( $.Site.Params.Author.imagequality | default "96" )) }}
          {{ end }}
          <img class="mb-2 rounded-2xl h-48 w-48 sm:h-60 sm:w-60 lg:h-72 lg:w-72 object-cover" alt="{{ $.Site.Params.Author.name | default "Author" }}"
            src="{{ $authorImage.RelPermalink }}" />
        {{ end }}
      {{ end }}

      <h1 class="py-2 text-2xl font-bold">
        {{ .Site.Params.Author.name | default .Site.Title }}
      </h1>

      {{ with .Site.Params.Author.headline }}
      <h2 class="text-lg sm:text-xl text-neutral-600 dark:text-neutral-400">
        {{ . | markdownify }}
      </h2>
      {{ end }}

      <div class="mt-1 text-xl">
        {{ partialCached "author-links.html" . }}
      </div>

      <h1 class="py-6 text-sm uppercase tracking-wide text-primary-500 dark:text-primary-400">
        download cv
      </h1>
    </div>

    <!-- MAIN CONTENT -->
    <div class="w-full flex flex-col items-start text-left">
      <h1 class="text-xl sm:text-2xl text-neutral-600 dark:text-neutral-400 mb-2 flex items-center gap-2">
        Hello, I'm 
        <span class="ml-2 relative overflow-hidden h-[3.2rem] sm:h-[3.8rem] leading-[3.2rem] sm:leading-[3.8rem] text-primary-600 dark:text-primary-400">
          <ol class="m-0 p-0">
            <li><span>Hazel Pernanda Putra</span></li>
            <li><span>Computer Vision Engineer</span></li>
            <li><span>Machine Learning Engineer</span></li>
            <li><span>Anjayy</span></li>
          </ol>
        </span>
      </h1>

      <h1 class="text-3xl sm:text-4xl md:text-5xl lg:text-6xl text-neutral-700 dark:text-neutral-300 font-bold leading-tight mb-6">
        Computer Engineer Enthusiast<br>
        Student of Bachelor Mathematics<br>
        Padjadjaran University, Indonesia
      </h1>

      <article class="text-base sm:text-lg text-neutral-700 dark:text-neutral-400 leading-relaxed max-w-3xl">
        <p>
          Lorrem ollitia eligendi temporibus quidem ut. Minus? Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
          Totam obcaecati, aperiam illum dolorem reprehenderit id laborum quisquam dignissimos ut asperiores ullam? 
          Quod quas praesentium dicta necessitatibus dolor, tenetur culpa eius...
        </p>

        <div class="flex flex-row justify-center gap-4 mt-6 text-4xl sm:text-5xl text-neutral-600 dark:text-neutral-400">
          <div class="border p-2">1</div>
          <div class="border p-2">2</div>
          <div class="border p-2">3</div>
        </div>
      </article>
    </div>
  </header>

  <section class="prose dark:prose-invert px-4">{{ .Content }}</section>
</article>

<section>
  {{ partial "recent-articles/main.html" . }}
</section>
