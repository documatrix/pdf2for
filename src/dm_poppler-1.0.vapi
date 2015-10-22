
[CCode (cheader_filename = "dm_poppler.h")]
namespace DMPoppler
{
  [CCode (cname="PathCmd")]
  public enum PathCmd
  {
    [CCode (cname="MOVE_TO")]
    MOVE_TO,
    [CCode (cname="LINE_TO")]
    LINE_TO,
    [CCode (cname="CURVE_TO")]
    CURVE_TO;

    public string to_string( )
    {
      switch ( this )
      {
        case MOVE_TO:
          return "moveto";
        case LINE_TO:
          return "lineto";
        case CURVE_TO:
          return "curveto";
         default:
          return "Undefined";
      }
    }
  }

  [CCode (cname="LineCap")]
  public enum LineCap
  {
    [CCode (cname="CAP_BUTT")]
    BUTT,
    [CCode (cname="CAP_ROUND")]
    ROUND,
    [CCode (cname="CAP_SQUARE")]
    SQUARE;

    public string to_string( )
    {
      switch ( this )
      {
        case BUTT:
          return "butt";
        case ROUND:
          return "round";
        case SQUARE:
          return "square";
         default:
          return "Undefined";
      }
    }
  }

  [CCode (cname="LineJoin")]
  public enum LineJoin
  {
    [CCode (cname="JOIN_MITER")]
    MITER,
    [CCode (cname="JOIN_ROUND")]
    ROUND,
    [CCode (cname="JOIN_BEVEL")]
    BEVEL;

    public string to_string( )
    {
      switch ( this )
      {
        case MITER:
          return "miter";
        case ROUND:
          return "round";
        case BEVEL:
          return "bevel";
         default:
          return "Undefined";
      }
    }
  }

  [CCode (cname="LineDash")]
  public struct LineDash
  {
    [CCode (array_length_cname = "length")]
    public double[] pattern;
    public double start;
  }

  [CCode (cname="RGBAColor")]
  public struct RGBAColor
  {
    public int red;
    public int green;
    public int blue;
    public double alpha;
  }

  [CCode (cname = "Word")]
  public struct Word
  {
    public double x1;
    public double y1;
    public double x2;
    public double y2;
    public string text;
    public double font_size;
  }

  [CCode (cname = "ForPath", free_function="dm_poppler_for_path_destroy", destroy_function="")]
  public struct ForPath
  {
    [CCode (array_length_cname = "count", array_length_type = "guint")]
    public double[] x;
    [CCode (array_length_cname = "count", array_length_type = "guint")]
    public double[] y;
    [CCode (array_length_cname = "count", array_length_type = "guint")]
    public PathCmd[] cmd;
    public bool fill;
    public RGBAColor color;
    public double line_weight;
    public LineCap line_cap;
    public LineJoin line_join;
    public LineDash line_dash;
  }

  [CCode (cname = "get_words")]
  bool get_words( Poppler.Page *poppler_page, [CCode (array_length_cname = "n_words", array_length_pos = 2.1, array_length_type = "guint")] out Word[] words );

  [CCode (cname = "get_paths")]
  bool get_paths( Poppler.Page *poppler_page, [CCode (array_length_cname = "n_paths", array_length_pos = 2.1, array_length_type = "guint")] out ForPath[] paths );
}
