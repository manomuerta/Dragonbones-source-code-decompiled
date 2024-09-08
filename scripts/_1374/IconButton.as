package _1374
{
   import _1045.Button;
   import _1045._1105;
   
   public class IconButton extends Button
   {
      public var _2448:_1105;
      
      private var _icon:Object;
      
      public function IconButton()
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
         if(this._2448 != null)
         {
            this._2448.source = this._icon;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2448)
         {
            if(this._icon != null)
            {
               this._2448.source = this._icon;
            }
         }
      }
   }
}

