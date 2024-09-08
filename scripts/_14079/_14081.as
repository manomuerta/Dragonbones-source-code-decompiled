package _14079
{
   import _721._720;
   
   public class _14081 implements _14083
   {
      public var _14685:int = 0;
      
      public var _14684:int = 0;
      
      public var _14676:Number = 1;
      
      public var _14679:Boolean = false;
      
      public var bgColor:uint = 16777215;
      
      public var isPreview:Boolean = true;
      
      public var _14678:int = 0;
      
      public var _14438:String = "";
      
      public var repeat:int = 0;
      
      public var quality:int = 3;
      
      public var _14683:int;
      
      public function _14081()
      {
         this._14683 = _720.IMAGES_PACKAGE_FILES;
         super();
      }
      
      public function set _14673(param1:int) : void
      {
         this._14678 = param1;
      }
      
      public function get _14673() : int
      {
         return this._14678;
      }
      
      public function set _14674(param1:String) : void
      {
         this._14438 = param1;
      }
      
      public function get _14674() : String
      {
         return this._14438;
      }
      
      public function set scale(param1:Number) : void
      {
         this._14676 = param1;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         this.bgColor = param1;
      }
      
      public function set hasBackground(param1:Boolean) : void
      {
         this._14679 = param1;
      }
      
      public function _14453() : void
      {
         this._14685 = 0;
         this._14684 = 0;
         this._14676 = 1;
         this._14679 = false;
         this.bgColor = 16777215;
         this.isPreview = true;
         this._14678 = 0;
         this._14438 = "";
         this.repeat = 0;
         this.quality = 3;
         this._14683 = _720.IMAGES_PACKAGE_FILES;
      }
   }
}

