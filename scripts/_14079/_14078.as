package _14079
{
   import _721._720;
   import _97._101;
   
   public class _14078 implements _14083
   {
      public var dataType:int = 0;
      
      public var dataVersion:String = "5.5";
      
      public var _14675:String;
      
      public var _14676:Number = 1;
      
      public var _14679:Boolean = false;
      
      public var bgColor:uint = 16777215;
      
      public var isPreview:Boolean = true;
      
      public var _14678:int = 0;
      
      public var _14438:String = "";
      
      public var _14677:Boolean = true;
      
      public var _14493:Boolean = true;
      
      public var isZip:Boolean = false;
      
      public function _14078()
      {
         this._14675 = _720.IMAGE_TYPE_TEXTURE;
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
         this.dataType = 0;
         this.dataVersion = _101.DATA_VERSION;
         this._14675 = _720.IMAGE_TYPE_TEXTURE;
         this._14676 = 1;
         this._14679 = false;
         this.bgColor = 16777215;
         this.isPreview = true;
         this._14678 = 0;
         this._14438 = "";
         this._14677 = true;
         this._14493 = true;
         this.isZip = false;
      }
   }
}

