package _14201
{
   import _14193._14194;
   import _14193._14195;
   import _14193._14197;
   import _14240.StringUtil;
   import _14240._14246;
   import flash.geom.Rectangle;
   
   public class _14221 extends _14197 implements _14195
   {
      protected var _15403:_14197;
      
      private var _15362:Boolean = false;
      
      private var _15365:String;
      
      public function _14221()
      {
         super("use");
      }
      
      public function get _15316() : String
      {
         return this._15365;
      }
      
      public function set _15316(param1:String) : void
      {
         this._15365 = param1;
         this._15362 = true;
         _2466();
      }
      
      public function get _15189() : String
      {
         return _1699("preserveAspectRatio") as String;
      }
      
      public function set _15189(param1:String) : void
      {
         _15253("preserveAspectRatio",param1);
      }
      
      public function get _15196() : String
      {
         return _1699("x") as String;
      }
      
      public function set _15196(param1:String) : void
      {
         _15253("x",param1);
      }
      
      public function get _15197() : String
      {
         return _1699("y") as String;
      }
      
      public function set _15197(param1:String) : void
      {
         _15253("y",param1);
      }
      
      public function get _15195() : String
      {
         return _1699("width") as String;
      }
      
      public function set _15195(param1:String) : void
      {
         _15253("width",param1);
      }
      
      public function get _15194() : String
      {
         return _1699("height") as String;
      }
      
      public function set _15194(param1:String) : void
      {
         _15253("height",param1);
      }
      
      public function get _15193() : String
      {
         return _1699("overflow") as String;
      }
      
      public function set _15193(param1:String) : void
      {
         _15253("overflow",param1);
      }
      
      override protected function _2476() : void
      {
         var _loc1_:SVG = null;
         super._2476();
         if(this._15362)
         {
            this._15362 = false;
            if(this._15403 != null)
            {
               content.removeChild(this._15403);
               _15200(this._15403);
               this._15403 = null;
            }
            if(this._15316)
            {
               this._15403 = document._15206(StringUtil.ltrim(this._15316,"#"));
               _15201(this._15403);
               content.addChild(this._15403);
            }
         }
         if(this._15403)
         {
            this._15403.x = !!this._15196 ? _15258(this._15196,_14246.WIDTH) : 0;
            this._15403.y = !!this._15197 ? _15258(this._15197,_14246.HEIGHT) : 0;
            if(this._15403 is SVG)
            {
               _loc1_ = this._15403 as SVG;
               if(this._15195)
               {
                  _loc1_._15195 = this._15195;
               }
               if(this._15194)
               {
                  _loc1_._15194 = this._15194;
               }
            }
         }
      }
      
      override protected function _15213() : Rectangle
      {
         if(this._15403 is _14194)
         {
            return (this._15403 as _14194)._15190;
         }
         return null;
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14221 = super.clone(param1) as _14221;
         _loc2_._15316 = this._15316;
         return _loc2_;
      }
   }
}

