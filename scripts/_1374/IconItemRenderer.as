package _1374
{
   import _1045._1105;
   import _1088.ItemRenderer;
   
   public class IconItemRenderer extends ItemRenderer
   {
      public var _2448:_1105;
      
      private var _icon:Object;
      
      public function IconItemRenderer()
      {
         super();
      }
      
      public function get icon() : Object
      {
         return this._icon;
      }
      
      public function set icon(param1:Object) : void
      {
         this._icon = param1;
         if(this._2448)
         {
            this._2448.source = param1;
         }
      }
   }
}

