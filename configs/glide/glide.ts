// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!
glide.keymaps.set("normal", "H", "tab_prev");
glide.keymaps.set("normal", "L", "tab_next");
glide.keymaps.set("normal", "<leader>n", "tab_new");
glide.keymaps.set("normal", "<leader>c", "tab_close");

const getTabsByPort = async (port: string) => {
  const tabs = await browser.tabs.query({
    url: 'http://localhost/*',
  });

  return tabs.filter((tab) => tab.url && new URL(tab.url).port === port)
}

const switchToOrCreate = async (url: URL) => {
  const tab = await glide.tabs.get_first({
    url: url.toString()
  })

  if (!tab) {
    await browser.tabs.create({
      url: url.toString()
    })
  }

  assert(tab && tab.id);

  await browser.tabs.update(tab.id, { active: true });
}

// ===== Entertainment =====

// YouTube
glide.keymaps.set("normal", "<leader>yt", async () => {
  switchToOrCreate(new URL(`https://youtube.com`))
}, { description: "go to [y]out[t]ube" })

// Bandcamp
glide.keymaps.set("normal", "<leader>bc", async () => {
  switchToOrCreate(new URL(`https://bandcamp.com`))
}, { description: "go to [y]out[t]ube" })

// Monkeytype
glide.keymaps.set("normal", "<leader>mt", async () => {
  switchToOrCreate(new URL(`https://monkeytype.com/`))
}, { description: "go to [m]onkey[t]ype" })

// ===== Work =====

// Localhost-related tab navigation
glide.keymaps.set("normal", "<leader>ln", async () => {
  const tabs = await getTabsByPort('3000')
  const nextjsTab = tabs.find((tab) => tab.url && !new URL(tab.url).pathname.startsWith('/studio')) || await browser.tabs.create({
    url: new URL('http://localhost:3000/').toString()
  })

  assert(nextjsTab && nextjsTab.id);

  await browser.tabs.update(nextjsTab.id, { active: true });
}, { description: "go to [l]ocalhost [n]ext.js" });

glide.keymaps.set("normal", "<leader>ls", async () => {
  const tabs = await getTabsByPort('3000')

  const sanityStudioTab = tabs.find((tab) => tab.url && new URL(tab.url).pathname.startsWith('/studio')) || await browser.tabs.create({
    url: new URL('http://localhost:3000/studio').toString()
  })

  assert(sanityStudioTab && sanityStudioTab.id);

  await browser.tabs.update(sanityStudioTab.id, { active: true });
}, { description: "go to [l]ocalhost [s]anity studio" });

glide.unstable.include("glide.private.ts");
