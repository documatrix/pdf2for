using DMPoppler;
using Poppler;
using Testlib;

namespace PDFLibTests
{
  public static int main( string[] args )
  {
    GLib.Test.init( ref args );

    GLib.TestSuite ts_dm_poppler = new GLib.TestSuite( "pdflib" );
    GLib.TestSuite.get_root( ).add_suite( ts_dm_poppler );

    /* DMPoppler */
    GLib.TestSuite ts_get_words = new GLib.TestSuite( "pdflib" );
    ts_get_words.add( new GLib.TestCase( "test_f_get_words", default_setup, test_f_get_words, default_teardown ) );
    ts_dm_poppler.add_suite( ts_get_words );

    GLib.TestSuite ts_get_paths = new GLib.TestSuite( "pdflib" );
    ts_get_paths.add( new GLib.TestCase( "test_f_get_paths", default_setup, test_f_get_paths, default_teardown ) );
    ts_dm_poppler.add_suite( ts_get_paths );

    GLib.Test.run( );
    return 0;
  }

  /**
   * This test-case tests the get_words method.
   */
  public static void test_f_get_words( )
  {
    File test_pdf = File.new_for_path( "../tests/test.pdf" );
    try
    {
      string uri = test_pdf.get_uri( );
      stdout.printf( "%s\n", uri );
      Document document = new Poppler.Document.from_file( uri, "" );

      Page page1 = document.get_page( 0 );

      Word[] words = null;
      DMPoppler.get_words( page1, out words );
      GLib.assert( words.length == 10 );
      for ( int i = 0; i < words.length; i ++ )
      {
        if ( words[ i ].text == "unten" )
        {
          GLib.assert( (int)words[ i ].y1 == 767 );
          GLib.assert( (int)words[ i ].y2 == 776 );
        }
        if ( words[ i ].text == "links" )
        {
          GLib.assert( (int)words[ i ].x1 == 100 );
          GLib.assert( (int)words[ i ].x2 == 120 );
        }
      }
    }
    catch ( Poppler.Error e )
    {
      GLib.assert( false );
    }
  }

  /**
   * This test-case tests the get_paths method.
   */
  public static void test_f_get_paths( )
  {
    File test_pdf = File.new_for_path( "../tests/test.pdf" );
    try
    {
      string uri = test_pdf.get_uri( );
      stdout.printf( "%s\n", uri );
      Document document = new Poppler.Document.from_file( uri, "" );

      Page page1 = document.get_page( 0 );
      ForPath[] paths = null;
      GLib.assert( DMPoppler.get_paths( page1, out paths ) );
      // GLib.assert( paths.length == 2 );
      // GLib.assert( paths[ 0 ].count == 7 );
      // GLib.assert( paths[ 0 ].line_weight < 11 );
      // GLib.assert( paths[ 0 ].line_weight > 9 );
      // GLib.assert( (int)paths[ 1 ].x[ 1 ] == 450 );
      // GLib.assert( (int)paths[ 1 ].y[ 1 ] == 328 );
      // GLib.assert( paths[ 1 ].cmd[ 1 ] == PathCmd.LINE_TO );
      // GLib.assert( !paths[ 1 ].fill );
      stdout.printf( "Path count %d\n", paths.length );

      stdout.printf( "Path count %d\n", paths.length );
      foreach ( unowned ForPath path in paths )
      {
        stdout.printf( "Dash Start:%3.2f", path.line_dash.start );
        for ( int dash_nr = 0; dash_nr < path.line_dash.pattern.length; dash_nr ++ )
        {
          stdout.printf( " |%3.2f", path.line_dash.pattern[ dash_nr ] );
        }
        stdout.printf( "\n" );
        stdout.printf( "Path: R:%05d,G:%05d,B:%05d A:%lf LineWeight:%lf Fill?%s LineCap:%s LineJoin:%s\n",
          path.color.red,
          path.color.green,
          path.color.blue,
          path.color.alpha,
          path.line_weight,
          path.fill.to_string( ),
          path.line_cap.to_string( ),
          path.line_join.to_string( )
        );
        for ( int point_nr = 0; point_nr < path.x.length; point_nr ++ )
        {
          stdout.printf( "  X%03d Y%03d %s\n", (int)path.x[ point_nr ], (int)path.y[ point_nr ], path.cmd[ point_nr ].to_string( ) );
        }
        stdout.printf( "\n" );
      }
    }
    catch ( Poppler.Error e )
    {
      GLib.assert( false );
    }
  }
}