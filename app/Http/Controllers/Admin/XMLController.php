<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\GlobalHelper;
use App\Http\Controllers\Controller;
use App\Models\Contacts;
use App\Models\Events;
use App\Models\Faq;
use App\Models\Page;
use App\Models\PageSeo;
use App\Models\Website\Content\Content;
use App\Models\Website\Gallery\Album;
use App\Models\Website\News;
use App\Models\Website\Notice;
use Illuminate\Support\Facades\Storage;
use Spatie\ArrayToXml\ArrayToXml;

class XMLController extends Controller
{
    public function index()
    {
        $items = [
            ['id' => 1, 'name' => 'John Doe', 'email' => 'john.doe@example.com'],
            ['id' => 2, 'name' => 'Jane Smith', 'email' => 'jane.smith@example.com'],
            ['id' => 3, 'name' => 'Alice Johnson', 'email' => 'alice.johnson@example.com'],
        ];
        return response()->json($items);
    }

    public function generateXmlFile()
    {
        try {
            function isUrlBroken($url)
            {
                $ch = curl_init($url);
                curl_setopt($ch, CURLOPT_NOBODY, true);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_TIMEOUT, 5);
                curl_exec($ch);
                $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                curl_close($ch);
                return $httpCode >= 400;
            }
            // Handle static pages without slugs
            $data = [
                'home' => [
                    'page' => 'Home',
                    'url' => url('/'),
                    'admin_url' => '',
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Home')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/')),
                    'modified' => GlobalHelper::get_page_seo('Home')->updated_at ?? '',
                ],
                'contact' => [
                    'page' => 'Contact',
                    'url' => url('/contact-us'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/contacts'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Contact')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/contact-us')),
                    'modified' => GlobalHelper::get_page_seo('Contact')->updated_at ?? '',
                ],
                'admin' => [
                    'page' => 'Admin',
                    'url' => url('/admin'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/admin'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Admin')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/admin')),
                    'modified' => GlobalHelper::get_page_seo('Admin')->updated_at ?? '',
                ],
                'category' => [
                    'page' => 'Category',
                    'url' => url('/category'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/category'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Category')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/category')),
                    'modified' => GlobalHelper::get_page_seo('Category')->updated_at ?? '',
                ],

                'content' => [
                    'page' => 'Content',
                    'url' => url('/content'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/content'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Content')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/content')),
                    'modified' => GlobalHelper::get_page_seo('Content')->updated_at ?? '',
                ],
                'faq' => [
                    'page' => 'Faq',
                    'url' => url('/faq'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/faq'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Faq')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/faq')),
                    'modified' => GlobalHelper::get_page_seo('Faq')->updated_at ?? '',
                ],
                'events' => [
                    'page' => 'Events',
                    'url' => url('/events'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/events'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Events')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/events')),
                    'modified' => GlobalHelper::get_page_seo('Events')->updated_at ?? '',
                ],
                'notice' => [
                    'page' => 'Notice',
                    'url' => url('/notice'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/blog'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Notice')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/notice')),
                    'modified' => GlobalHelper::get_page_seo('Notice')->updated_at ?? '',
                ],
                'news' => [
                    'page' => 'News',
                    'url' => url('/news'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/news'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('News')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/news')),
                    'modified' => GlobalHelper::get_page_seo('News')->updated_at ?? '',
                ],
                'page' => [
                    'page' => 'Page',
                    'url' => url('/page'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/page'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('Page')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/page')),
                    'modified' => GlobalHelper::get_page_seo('Page')->updated_at ?? '',
                ],
                'pageSeo' => [
                    'page' => 'PageSeo',
                    'url' => url('/pageSeo'),
                    'page_type' => 'module',
                    'admin_url' => url('admin/pageSeo'),
                    'meta_tag_indicator' => GlobalHelper::get_page_seo('PageSeo')->meta_tag_indicator ?? '',
                    'broken_url' => isUrlBroken(url('/pageSeo')),
                    'modified' => GlobalHelper::get_page_seo('PageSeo')->updated_at ?? '',
                ],
            ];
            $contents = Content::where('status', 'active')->get();
            foreach ($contents as $key => $content) {
                if ($content->slug) {
                    $data['contents_' . $key] = [
                        'page' => $content->title,
                        'url' => url('content/' . $content->slug),
                        'page_type' => 'content',
                        'admin_url' => url('admin/content/' . $content->id . '/edit'),
                        'meta_tag_indicator' => $content->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('content/' . $content->slug)),
                        'modified' => $content->updated_at,
                    ];
                }
            }
            $contacts = Contacts::where('status', 'active')->get();
            foreach ($contacts as $key => $contact) {
                if ($contact->slug) {
                    $data['contact_' . $key] = [
                        'page' => $contact->title,
                        'url' => url('contacts/' . $contact->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/contacts/' . $contact->id . '/edit'),
                        'meta_tag_indicator' => $contact->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('contact/' . $contact->slug)), // boolean value
                        'modified' => $contact->updated_at,
                    ];
                }
            }
            $faqs = Faq::where('status', 'active')->get();
            foreach ($faqs as $key => $faq) {
                if ($faq->slug) {
                    $data['faq_' . $key] = [
                        'page' => $faq->title,
                        'url' => url('faq/' . $faq->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/faq/' . $faq->id . '/edit'),
                        'meta_tag_indicator' => $faq->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('faq/' . $faq->slug)), // boolean value
                        'modified' => $faq->updated_at,
                    ];
                }
            }
            $events = Events::where('status', 'active')->get();
            foreach ($events as $key => $event) {
                if ($event->slug) {
                    $data['event_' . $key] = [
                        'page' => $event->title,
                        'url' => url('events/' . $event->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/events/' . $event->id . '/edit'),
                        'meta_tag_indicator' => $event->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('events/' . $event->slug)), // boolean value
                        'modified' => $event->updated_at,
                    ];
                }
            }
            $notices = Notice::where('status', 'active')->get();
            foreach ($notices as $key => $notice) {
                if ($notice->slug) {
                    $data['notice_' . $key] = [
                        'page' => $notice->title,
                        'url' => url('notice/' . $notice->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/notice/' . $notice->id . '/edit'),
                        'meta_tag_indicator' => $notice->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('notice/' . $notice->slug)), // boolean value
                        'modified' => $notice->updated_at,
                    ];
                }
            }
            $newss = News::where('status', 'active')->get();
            foreach ($newss as $key => $news) {
                if ($news->slug) {
                    $data['news_' . $key] = [
                        'page' => $news->title,
                        'url' => url('news/' . $news->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/news/' . $news->id . '/edit'),
                        'meta_tag_indicator' => $news->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('news/' . $news->slug)), // boolean value
                        'modified' => $news->updated_at,
                    ];
                }
            }
            $pages = Page::where('status', 'active')->get();
            foreach ($pages as $key => $page) {
                if ($page->slug) {
                    $data['page_' . $key] = [
                        'page' => $page->title,
                        'url' => url('page/' . $page->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/page/' . $page->id . '/edit'),
                        'meta_tag_indicator' => $page->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('page/' . $page->slug)), // boolean value
                        'modified' => $page->updated_at,
                    ];
                }
            }
            $pageSeos = PageSeo::where('status', 'active')->get();
            foreach ($pageSeos as $key => $pageSeo) {
                if ($pageSeo->slug) {
                    $data['pageSeo_' . $key] = [
                        'pageSeo' => $pageSeo->title,
                        'url' => url('pageSeo/' . $page->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/pageSeo/' . $pageSeo->id . '/edit'),
                        'meta_tag_indicator' => $pageSeo->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('pageSeo/' . $pageSeo->slug)), // boolean value
                        'modified' => $pageSeo->updated_at,
                    ];
                }
            }

            $albums = Album::where('status', 'active')->get();
            // $data['albums'] = [];
            foreach ($albums as $key => $album) {
                if ($album->slug) {
                    $data['albums_' . $key] = [
                        'page' => $album->name,
                        'url' => url('gallery/photos/' . $album->slug),
                        'page_type' => 'module',
                        'admin_url' => url('admin/album/' . $album->id . '/edit'),
                        'meta_tag_indicator' => $album->meta_tag_indicator,
                        'broken_url' => isUrlBroken(url('gallery/photos/' . $album->slug)),
                        'modified' => $album->updated_at,
                    ];
                }
            }
            // Convert the array to XML
            $xml = ArrayToXml::convert($data, 'root');

            // Define the file path and name
            $filePath = 'xml-files/data.xml';

            // Save the XML to storage
            Storage::disk('local')->put($filePath, $xml);

            // Return a success message
            return response()->json(['message' => 'XML file created successfully.']);
        } catch (\Exception $e) {
            // Handle error and return a failure response
            return response()->json(['message' => 'An error occurred while creating the XML file.', 'error' => $e->getMessage()], 500);
        }
    }

    public function getXmlFile()
    {
        $filePath = storage_path('app/xml-files/data.xml');

        if (!file_exists($filePath)) {
            return response()->json(['message' => 'File not found'], 404);
        }

        $content = file_get_contents($filePath);

        return response($content, 200)->header('Content-Type', 'application/xml');
    }
}
